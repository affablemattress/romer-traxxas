#include "ros/ros.h"

#include "tcp_parser/GPSData.h"

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

#include <unistd.h>

#include <netdb.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>

#define BUFFER_SIZE 1024


int main(int argc, char** argv) {
	ros::Rate spin_rate(100);

	ros::init(argc, argv, "tcp_parser");
	ros::NodeHandle node_handle;
	
	ros::Publisher GPSPublisher = node_handle.advertise<tcp_parser::GPSData>("gps_data", 10);
	ros::Rate connection_retry_rate(3);

	ROS_INFO("TCP parser started!");

	int socket_fd;
	bool emlid_connected = false;


	/**
	 * SANITISE INPUT
	 */
	if(!(argc == 3)) {
		ROS_ERROR("Format error: rosrun tcp_parser tcp_parser_node [EMLID_IPv4] [TCP_PORT]\n");
		exit(1);
	}
	in_addr t_emlid_address;
	if(inet_pton(AF_INET, argv[1], &t_emlid_address) == 0) {
		ROS_ERROR("Couldn't recognise IPv4 address: %s\n", argv[1]);
		exit(1);
	}
	int emlid_port = 0;
	if(!((emlid_port = atoi(argv[2])) > 0)) {
		ROS_ERROR("Couldn't recognise port: %s\n", argv[2]);
		exit(1);
	}


	while(ros::ok()) {
		while(!emlid_connected) {
			ROS_INFO("Trying connection in 3s...\n");
			connection_retry_rate.sleep();


			/**
			 * GET ADDRESS INFO
			 */
			addrinfo address_hints, *emlid_address_info;
			memset(&address_hints, 0, sizeof(address_hints));
			address_hints.ai_family = AF_INET;
			address_hints.ai_socktype = SOCK_STREAM;

			int rv;
			if((rv = getaddrinfo(argv[1], argv[2], &address_hints, &emlid_address_info)) != 0) {
				ROS_WARN("getaddrinfo() failed: %s\n", gai_strerror(rv));
				continue;
			}


			/**
			 * TRY CONNECTION
			 */
			addrinfo* iterator;
			for(iterator = emlid_address_info; iterator != NULL; iterator = iterator->ai_next) {
				if ((socket_fd = socket(iterator->ai_family, iterator->ai_socktype, iterator->ai_protocol)) == -1) {
					ROS_WARN("socket() failed: %s\n", strerror(errno));
					continue;
				}
				if (connect(socket_fd, iterator->ai_addr, iterator->ai_addrlen) == -1) {
					close(socket_fd);
					ROS_WARN("connect() failed: %s\n", strerror(errno));
					continue;
				}
				break;
			}
			if(iterator == NULL) {
				ROS_WARN("Couldn't connect.\n");
				freeaddrinfo(emlid_address_info);
				continue;
			}
	
			emlid_connected = true;
			ROS_INFO("Connected to Emlid M2 at: \n");
			freeaddrinfo(emlid_address_info);
			break;
		}


		/**
		 * RECEIVE DATA & SEND MESSAGE
		 */
		int recv_bytes;
		char recv_buffer[BUFFER_SIZE];
		if ((recv_bytes = recv(socket_fd, recv_buffer, BUFFER_SIZE - 1, 0)) == -1) {
			//rec() failed
			ROS_WARN("recv() failed: %s\n", strerror(errno));
			continue;
		} 
		else if (recv_bytes == 0) { 
			//connection dropped by host
			emlid_connected = false;
		}
		else { 
			//data received successfully
			recv_buffer[recv_bytes] = '\0';

			tcp_parser::GPSData msg;

			//set headptr to first relevant data e.g. the third space
			int head_index = 0;
			for(int space_count = 0; space_count < 3; head_index++) {
				if(recv_buffer[head_index] == ' ') space_count++;
			}

			//extract data from buffer
			char* headptr = &recv_buffer[head_index], *tailptr;

			msg.latitude       = strtod(headptr, &tailptr);
			headptr = tailptr;
			msg.longitude      = strtod(headptr, &tailptr);
			headptr = tailptr;
			msg.height         = strtod(headptr, &tailptr);
			headptr = tailptr;

			msg.fix_type       = strtol(headptr, &tailptr, 10);
			headptr = tailptr;
			msg.num_satellites = strtol(headptr, &tailptr, 10);
			headptr = tailptr;

			msg.sdn            = strtod(headptr, &tailptr);
			headptr = tailptr;
			msg.sde            = strtod(headptr, &tailptr);
			headptr = tailptr;
			msg.sdu            = strtod(headptr, &tailptr);
			headptr = tailptr;
			msg.sdne           = strtod(headptr, &tailptr);
			headptr = tailptr;
			msg.sdeu           = strtod(headptr, &tailptr);
			headptr = tailptr;
			msg.sdun           = strtod(headptr, &tailptr);
			headptr = tailptr;

			GPSPublisher.publish(msg);
		}

		ros::spinOnce();
		spin_rate.sleep();
	}

	return 0;
}


#include "ros/ros.h"

#include "controller/ControllerOut.h"

#include "relay/RelayState.h"
#include "tcp_parser/GPSData.h"
#include "imu_parser/IMUData.h"


void relayStateCallback(const relay::RelayState& relay_state) {
    ROS_INFO("Received relay state.\n" 
             "\tcontrol mode: %d\n"
             "\tis emergency: %d\n",
             relay_state.control_mode, relay_state.is_emergency);
}

void gpsCallback(const tcp_parser::GPSData& gpsData) {
    ROS_INFO("Received GPS data.\n" 
             "\t latitude: %.10lf\n"
             "\tlongitude: %.10lf\n"
             "\t   height: %.10lf\n"
             "\t fix_type: %d\n"
             "\t  num_sat: %d\n"
             "\t      sdn: %.10lf\n"
             "\t      sde: %.10lf\n"
             "\t      sdu: %.10lf\n"
             "\t     sdne: %.10lf\n"
             "\t     sdeu: %.10lf\n"
             "\t     sdun: %.10lf\n",
             gpsData.latitude, gpsData.longitude, gpsData.height,
             gpsData.fix_type, gpsData.num_satellites,
             gpsData.sdn, gpsData.sde, gpsData.sdu, 
             gpsData.sdne, gpsData.sdeu, gpsData.sdun);
}

void imuCallback(const imu_parser::IMUData& imu_data) {
    ROS_INFO("Received IMU data.\n"
             "\t heading: %lf\n",
             imu_data.heading);
}


int main(int argc, char** argv) {
    ros::init(argc, argv, "controller");
    ros::NodeHandle node;

    ros::Publisher controller_out_pub = node.advertise<controller::ControllerOut>("controller_out", 10);

    ros::Subscriber relay_state_sub   = node.subscribe("relay_state", 10, &relayStateCallback);
    ros::Subscriber gps_data_sub      = node.subscribe("gps_data", 10, &gpsCallback);
    ros::Subscriber imu_data_sub      = node.subscribe("imu_data", 10, &imuCallback);

    ros::Rate sleepRate(1);

    while(ros::ok()) {
        static double msgID = 0.0;

        ROS_INFO("Controller spun once.");

        controller::ControllerOut msg;
        msg.steer = msgID;
        msg.speed = msgID + 1.0;

        controller_out_pub.publish(msg);

        ros::spinOnce();

        sleepRate.sleep();
    }
}
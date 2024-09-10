#include "ros/ros.h"

#include "imu_parser/IMUData.h"
#include "imu_parser/IMURaw.h"

#include "relay/time_util.hpp"

struct IMUState {
    tu::time_point send_time;

    double heading;
    bool is_calibrated;
} static imu_state = { .send_time = tu::time_point::min(), .heading = 0.0, .is_calibrated = false };

void imuCallback(const imu_parser::IMURaw& imu_raw) {
    imu_state.heading = 360.0 - imu_raw.yaw;
    imu_state.is_calibrated = (imu_raw.calibration_quality == 3) ? true : false;

    imu_state.send_time = tu::time_point::min(); //set send time to min so data gets sent immidiately on recv
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "imu_parser");
    ros::NodeHandle node;

    ros::Rate spin_rate(100);

    ros::Publisher imu_data_pub = node.advertise<imu_parser::IMUData>("imu_data", 100, true);
    ros::Subscriber imu_raw_sub = node.subscribe("imu_raw", 100, &imuCallback);
    imu_parser::IMUData imu_data_msg;

    while(ros::ok()) {
        auto current_time = tu::clock::now();

        if(tu::deltaT(current_time, imu_state.send_time) > 100) {
            //publish imu data at 10Hz minimum
            imu_data_msg.heading = imu_state.heading;
            imu_data_pub.publish(imu_data_msg);
        }

        ros::spinOnce();
        spin_rate.sleep();
    }
}
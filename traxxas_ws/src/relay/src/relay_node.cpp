#include "ros/ros.h"

#include "relay/time_util.hpp"

#include "relay/RelayState.h"
#include "relay/Steer.h"

#include "sensor_msgs/Joy.h"
#include "controller/ControllerOut.h"

//enum definitions
enum ControlMode : int8_t {
    Manual = 0,
    Auto   = 1
};

enum JoystickButtonIndex : int8_t {
    JoyA = 0,
    JoyB = 1,
    JoyX = 2, 
    JoyY = 3, 
    JoyLB = 4,
    JoyRB = 5,
    JoyBack = 6,
    JoyStart = 7,
    JoyMisc = 8
};
enum JoystickAxisIndex : int8_t {
    JoyAxisLX = 0,
    JoyAxisLY = 1,
    JoyAxisLT = 2,
    JoyAxisRX = 3,
    JoyAxisRY = 4,
    JoyAxisRT = 5,
    JoyAxisPadX = 6,
    JoyAxisPadY = 7
};

const static JoystickButtonIndex button_emergency_stop   = JoyY;
const static JoystickButtonIndex button_emergency_cancel = JoyB;
const static JoystickButtonIndex button_safety           = JoyRB;
const static JoystickButtonIndex button_manual           = JoyX;
const static JoystickButtonIndex button_auto             = JoyA;

struct RelayState {
    tu::time_point send_time; //set to min() on input receive, now() on send

    ControlMode current_mode;
    bool is_emergency;
} static relay_state = { .send_time = tu::time_point::min(), .current_mode = Manual, .is_emergency = false };

struct JoyInputState {
    tu::time_point send_time; //set to min() on input receive, now() on send

    double x_input;
    double y_input;
} static joy_state = { .send_time = tu::time_point::min(), .x_input = 0.0, .y_input = 0.0 };

struct ControllerState {
    tu::time_point send_time; //set to min() on input receive, now() on send

    double x_input;
    double y_input;
} static controller_state = { .send_time = tu::time_point::min(), .x_input = 0.7, .y_input = 0.0 };

void joyCallback(const sensor_msgs::Joy& joystick_out) {
    if(joystick_out.buttons[button_emergency_stop]) {
        //check emergency state
        relay_state.current_mode = Manual;
        relay_state.is_emergency = true;
        relay_state.send_time    = tu::time_point::min(); //send emergency immediately
    } 
    else if(joystick_out.buttons[button_emergency_cancel] && joystick_out.axes[JoyAxisLX] == 0.0) {
        //lift emergency if button pressed AND left stick is idle
        relay_state.is_emergency = false;
    }

    if(!relay_state.is_emergency) {
        //check mode change
        if(joystick_out.buttons[button_manual]) {
            relay_state.current_mode = Manual;
        } else if(joystick_out.buttons[button_auto]) {
            relay_state.current_mode = Auto;
        }
    }

    if(joystick_out.buttons[button_safety] && relay_state.current_mode == Manual && (!relay_state.is_emergency)) {
        //if manual, safety button pressed and not emergency stopped. relay input to serial,
        joy_state.x_input = -joystick_out.axes[JoyAxisRX];
        joy_state.y_input = joystick_out.axes[JoyAxisLY];
        joy_state.send_time = tu::time_point::min();
    }
    else if (!joystick_out.buttons[button_safety] && relay_state.current_mode == Manual && (!relay_state.is_emergency)) {
        //if manual and not emergency stopped. but also safety button not pressed set input to 0,
        joy_state.x_input = 0.0;
        joy_state.y_input = 0.0;
    }

}

void controllerCallback(const controller::ControllerOut& controller_out) {
    //update controller state on recv
    controller_state.x_input   = controller_out.steer;
    controller_state.y_input   = controller_out.speed;
    controller_state.send_time = tu::time_point::min();
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "relay");
    ros::NodeHandle node;

    //create pub, sub, and services
    ros::Publisher relay_state_pub     = node.advertise<relay::RelayState>("relay_state", 100, true);
    ros::Publisher steer_pub           = node.advertise<relay::Steer>("steer", 100, true);
    ros::Subscriber joy_sub            = node.subscribe("joy", 100, &joyCallback);
    ros::Subscriber controller_out_sub = node.subscribe("controller_out", 100, &controllerCallback);

    //sleep rate
    ros::Rate sleep_rate(1);

    //send initial state to control mode topic
    relay::RelayState relay_state_msg;
    relay_state_msg.control_mode = relay_state.current_mode;
    relay_state_msg.is_emergency = relay_state.is_emergency;
    relay_state.send_time        = tu::clock::now();
    relay_state_pub.publish(relay_state_msg);

    //send initial joy state to serial
    relay::Steer steer_msg;
    steer_msg.speed     = (int8_t)floor(joy_state.y_input * 127.0);
    steer_msg.steer     = (int8_t)floor(joy_state.x_input * 127.0);
    joy_state.send_time = tu::clock::now();
    steer_pub.publish(steer_msg);

    while(ros::ok()) {
        tu::time_point current_time = tu::clock::now();

        if(tu::deltaT(current_time, relay_state.send_time) > 1000) {
            //send relay state at 1Hz
            relay_state_msg.control_mode = relay_state.current_mode;
            relay_state_msg.is_emergency = relay_state.is_emergency;
            relay_state.send_time        = tu::clock::now();
            relay_state_pub.publish(relay_state_msg);

            if(relay_state.is_emergency) {
                //send emergency stop thru serial regularly
                steer_msg.steer     = 0;
                steer_msg.speed     = 0;
                joy_state.send_time = tu::clock::now();
                steer_pub.publish(steer_msg);
            }
        }

        if((!relay_state.is_emergency) && relay_state.current_mode == Manual && tu::deltaT(current_time, joy_state.send_time) > 50) {
            //send controller input at 20Hz if control mode manual and not in emergency
            steer_msg.speed     = (int8_t)floor(joy_state.y_input * 127.0);
            steer_msg.steer     = (int8_t)floor(joy_state.x_input * 127.0);
            joy_state.send_time = tu::clock::now();
            steer_pub.publish(steer_msg);
        } 
        else if((!relay_state.is_emergency) && relay_state.current_mode == Auto && tu::deltaT(current_time, controller_state.send_time) > 50) {
            //send controller state at 20Hz if control mode auto and not in emergency
            steer_msg.speed            = (int8_t)floor(controller_state.y_input * 127.0);
            steer_msg.steer            = (int8_t)floor(controller_state.x_input * 127.0);
            controller_state.send_time = tu::clock::now();
            steer_pub.publish(steer_msg);
        }

        ros::spinOnce();
    }
}

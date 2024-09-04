#!/usr/bin/env python3

import rospy
from tcp_parser.msg import *
from controller.msg import *

if __name__ == '__main__':
    lat=0
    lon=0

    angle=0 #-1 maximum counter clockwise (-45 degrees), 1 maximum clockwise (45 degrees)
    velocity=0 #-1 maximum backwards, 1 maximum forwards

    loopCount=0
    rospy.init_node("controller")
    rospy.loginfo("Node initialized.")
    control_pub = rospy.Publisher("controller_out", ControllerOut, queue_size=5)
    #Controllerout has steer and speed parameters which take values between -1 and 1
    message_rate=rospy.Rate(6)
    while not rospy.is_shutdown() :
        arduinoMessage = ControllerOut()
        if angle < 1 :
            angle += 0.05
            arduinoMessage.steer = angle        
        else :
            arduinoMessage.steer = angle
            if velocity < 0.5 :
                velocity += 0.05
                arduinoMessage.speed = velocity
            else :
                arduinoMessage.speed = velocity
        control_pub.publish(arduinoMessage)
        message_rate.sleep()
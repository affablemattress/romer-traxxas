#!/usr/bin/env python3

import rospy
from tcp_parser.msg import *
from controller.msg import *
from controller.srv import *

lat=0
lon=0


angle=0 #-1 maximum counter clockwise (-45 degrees), 1 maximum clockwise (45 degrees)
velocity=0 #-1 maximum backwards, 1 maximum forwards

loopCount=0

def do_nothing(gps):
    global lat
    global lot
    global loopCount
    global angle
    global velocity

    lat=gps.latitude
    lot=gps.longitude


    try:
            coordinate_getter = rospy.ServiceProxy("gps_to_coord", GPSCoordinate)
            gps_new =  coordinate_getter(lat, lot)

    except rospy.ServiceException as serviceError0:
            rospy.logwarn("Service call failed: %s", serviceError0)


    rospy.loginfo("Latitude: " + str(lat) + " / Longitude: " + str(lot))
    
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

    loopCount += 1


if __name__ == '__main__':
    rospy.init_node("controller")
    rospy.loginfo("Node initialized.")
    rospy.loginfo("Waiting for GPS Converter Server.")
    rospy.wait_for_service("gps_to_coord")
    

    gps_sub = rospy.Subscriber("gps_data", GPSData, do_nothing)
    control_pub = rospy.Publisher("controller_out", ControllerOut, queue_size=5)
    #Controllerout has steer and speed parameters which take values between -1 and 1
    rospy.spin()

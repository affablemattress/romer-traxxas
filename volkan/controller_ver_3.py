#!/usr/bin/env python3

import rospy
from tcp_parser.msg import *
from controller.msg import *
from controller.srv import *


lat=0.0
lon=0.0

xpos=0.0
ypos=0.0

prevx=0.0
prevy=0.0


angle=0 #-1 maximum counter clockwise (-45 degrees), 1 maximum clockwise (45 degrees)
velocity=0 #-1 maximum backwards, 1 maximum forwards

loopCount=0

x_force=0.00
y_force=0.00

def output_calculation(deg):


def force_calculation(x, y):
    global x_force, y_force
    
    goal_x = 1.00
    goal_y = 2.50

    #The goal point pulls the vehicle (P)
    p_goal = 0.5
    goal_x_dist=(goal_x - x)
    goal_y_dist=(goal_y - y)
    goal_distance=(((goal_x_dist)**2)+((goal_y_dist)**2))**0.5
    x_force += goal_x_dist*p_goal*goal_distance
    y_force += goal_y_dist*p_goal*goal_distance



def main_callback(gps):
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
    
    force_calculation(gps_new.xcoord, gps_new.ycoord)

    output_calculation(a, gps_new.trans_angle)

    arduinoMessage = ControllerOut()
    
    # if angle < 1 :
    #     angle += 0.05
    #     arduinoMessage.steer = angle        
    # else :
    #     arduinoMessage.steer = angle
    #     if velocity < 0.5 :
    #         velocity += 0.05
    #         arduinoMessage.speed = velocity
    #     else :
    #         arduinoMessage.speed = velocity
    # control_pub.publish(arduinoMessage)
    

    arduinoMessage.steer=0.0
    arduinoMessage.speed=0.0
    control_pub.publish(arduinoMessage)

    loopCount += 1

    print(gps.xcoord)
    print(gps.ycoord)
    print(gps.trans_angle)

if __name__ == '__main__':

    rospy.init_node("controller")
    rospy.loginfo("Node initialized.")

    rospy.loginfo("Waiting for GPS Converter Server.")
    rospy.wait_for_service("gps_to_coord")
    

    gps_sub = rospy.Subscriber("gps_data", GPSData, main_callback)
    control_pub = rospy.Publisher("controller_out", ControllerOut, queue_size=5)
    #Controllerout has steer and speed parameters which take values between -1 and 1

    rospy.spin()

#!/usr/bin/env python3

import rospy

xcoordinate=0
ycoordinate=0

def do_nothing(gps):
    global xcoordinate
    global ycoordinate
    xcoordinate=gps.latitude
    ycoordinate=gps.longitude
    rospy.loginfo("Latitude: " + xcoordinate + " / Longitude: " + ycoordinate)


if __name__ == '__main__':
    rospy.init_node("motion_planning")
    rospy.loginfo("Node initialized.")
    gps_sub = rospy.Subscriber("gps_data", GPSData, do_nothing)
    rospy.spin()
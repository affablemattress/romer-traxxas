#!/usr/bin/env python3

import rospy
from controller.srv import *



if __name__ == '__main__':
    rospy.init_node("gps_converter")

    rospy.spin()

#!/usr/bin/env python3

import rospy
from controller.srv import *
import math


firstTime = True
conversionAngle = 0.0


def gps_coord_convert(coordinates, base_gps):
    global firstTime
    global conversionAngle

    posxvec=coordinates.latraw-base_gps[0]
    posyvec=coordinates.lonraw-base_gps[1]

    if firstTime:
        firstTime = False
        conversionAngle = math.atan(posyvec/posxvec)

    traxxas_new_x=(math.cos(conversionAngle)*posxvec + math.sin(conversionAngle)*posyvec)
    traxxas_new_y=(-1*math.sin(conversionAngle)*posxvec + math.cos(conversionAngle)*posyvec)

    return {"xcoord" : traxxas_new_x, "ycoord" : traxxas_new_y, "trans_angle" : math.degrees(conversionAngle)}
    


if __name__ == '__main__':

    while True:
        re_enter_base = input("Would you like to enter new base coordinates? (y/n):")
        if re_enter_base == 'y' or re_enter_base == 'Y' or re_enter_base== 'n' or re_enter_base == 'N' :
            break
        else :
            print("Please enter a valid response. ")
    
    if re_enter_base == 'y' or re_enter_base == 'Y':
        base_latitude = float(input("Enter base latitude: "))
        base_longitude = float(input("Enter base longitude: "))

        base_file = open("baseGPS.txt", "w")
        base_file.writelines([str(base_latitude),"\n", str(base_longitude),"\n"])
        base_file.close() 
    else :
        base_file = open("baseGPS.txt", "r")
        lines=base_file.readlines()

        base_latitude=float(lines[0])
        base_longitude=float(lines[1])  
        

    rospy.init_node("gps_converter")
    gps_service=rospy.Service("gps_to_coord", GPSCoordinate, gps_coord_convert, (base_latitude, base_longitude))
    rospy.spin()
    
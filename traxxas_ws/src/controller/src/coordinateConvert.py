#!/usr/bin/env python3

import rospy
from controller.srv import *
import math


firstTime = True
conversionAngle = 0.0

base_latitude=0.0
base_longitude=0.0

x_mult = 1
y_mult = 1

def gps_coord_convert(coordinates):
    global firstTime
    global conversionAngle

    global x_mult, y_mult

    posxvec=coordinates.latraw - base_latitude
    posyvec=coordinates.lonraw - base_longitude

    if firstTime:
        firstTime = False

        if posxvec < 0 :
            x_mult = -1
        if posyvec > 0 :
            y_mult = -1
        posxvec *= x_mult
        posyvec *= y_mult

        conversionAngle = math.atan(posyvec/posxvec)

    else :
        posxvec *= x_mult
        posyvec *= y_mult      

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
    gps_service=rospy.Service("gps_to_coord", GPSCoordinate, gps_coord_convert)
    rospy.spin()
    
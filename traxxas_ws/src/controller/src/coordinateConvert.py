#!/usr/bin/env python3

import rospy
from controller.srv import *
import math


firstTime = True
conversionAngle = 0.0

base_latitude=0.0
base_longitude=0.0

#our transformations will rely on the radius of the Earth at
#the test latitude (the earth is not a perfect sphere!)
def env_radius (env_lat):
    env_lat=math.radians(env_lat)
    r_eq = 6378.137  #Radius at the equator
    r_po = 6356.752  #Radius at the poles
    c = (r_eq**2*math.cos(env_lat))**2
    d = (r_po**2*math.sin(env_lat))**2
    e = (r_eq*math.cos(env_lat))**2
    f = (r_po*math.sin(env_lat))**2
    R = math.sqrt((c+d)/(e+f))
    return R

def gps_coord_convert(coordinates):
    global firstTime
    global conversionAngle

    global x_mult, y_mult

    #the coordinates of the vehicle with relation to GPS:
    posyvec=coordinates.latraw - base_latitude
    posxvec=coordinates.lonraw - base_longitude

    #when this function is called for the first time, the coordinate
    #conversion parameters need to be calculated
    if firstTime:
        firstTime = False

        earth_rad = env_radius(base_latitude)

        #firstly, go from a spherical coordinate system to a rectangular one
        posxvec = earth_rad*posxvec*pi/180
        posyvec = earth_rad*posyvec*pi/180

        if posxvec < 0 :
            x_mult *= -1
        if posyvec < 0 :
            y_mult *= -1
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

    #the following while-if-else blocks ask the user if they want to update
    #the base coordinates. if the test environment is unchanged, the user can
    #choose to not enter the same values again, and since the base coordinates
    #are stored in the text file baseGPS.txt, the previously entered values
    #can be used
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
    
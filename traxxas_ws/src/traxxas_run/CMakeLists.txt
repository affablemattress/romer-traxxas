cmake_minimum_required(VERSION 3.0.2)
project(traxxas_run)

find_package(catkin REQUIRED COMPONENTS roslaunch)
roslaunch_add_file_check(launch)


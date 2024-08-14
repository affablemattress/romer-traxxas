cmake_minimum_required(VERSION 2.8.3)

add_compile_options(-std=c++11)

include_directories(${ROS_LIB_DIR})

generate_arduino_firmware(traxxas
    SRCS main.cpp ${ROS_LIB_DIR}/time.cpp
    BOARD uno
    PORT /dev/ttyACM0
)
cmake_minimum_required(VERSION 3.0.2)
project(arduino)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS rosserial_arduino rosserial_client std_msgs)

catkin_package()

rosserial_generate_ros_lib(
  PACKAGE rosserial_arduino
  SCRIPT make_libraries.py
)

rosserial_configure_client(
  DIRECTORY firmware
  TOOLCHAIN_FILE ${ROSSERIAL_ARDUINO_TOOLCHAIN}
)

rosserial_add_client_target(firmware traxxas ALL)
rosserial_add_client_target(firmware traxxas-upload)
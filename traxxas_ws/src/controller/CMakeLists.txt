cmake_minimum_required(VERSION 3.0.2)
project(controller)

find_package(catkin REQUIRED COMPONENTS message_generation rospy std_msgs tcp_parser)

add_message_files(FILES ControllerOut.msg)
generate_messages(DEPENDENCIES std_msgs)

catkin_package(CATKIN_DEPENDS message_generation message_runtime rospy std_msgs)

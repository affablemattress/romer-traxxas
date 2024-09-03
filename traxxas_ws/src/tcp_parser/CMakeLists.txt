cmake_minimum_required(VERSION 3.0.2)
project(tcp_parser)

find_package(catkin REQUIRED COMPONENTS roscpp rospy std_msgs message_generation)

add_message_files(FILES GPSData.msg)
generate_messages(DEPENDENCIES std_msgs)

catkin_package(CATKIN_DEPENDS roscpp rospy std_msgs message_generation message_runtime)

include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(tcp_parser_node src/tcp_parser_node.cpp)
target_link_libraries(tcp_parser_node ${catkin_LIBRARIES})
add_dependencies(tcp_parser_node ${tcp_parser_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

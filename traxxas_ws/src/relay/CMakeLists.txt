cmake_minimum_required(VERSION 3.0.2)
project(relay)

find_package(catkin REQUIRED COMPONENTS message_generation roscpp std_msgs)

add_message_files(FILES RelayState.msg Steer.msg)
generate_messages(DEPENDENCIES std_msgs)

catkin_package(CATKIN_DEPENDS message_generation roscpp std_msgs)

include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(relay_node src/relay_node.cpp)
add_dependencies(relay_node ${relay_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(relay_node ${catkin_LIBRARIES})
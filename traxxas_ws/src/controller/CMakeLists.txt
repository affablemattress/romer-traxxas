cmake_minimum_required(VERSION 3.0.2)
project(controller)

find_package(catkin REQUIRED COMPONENTS message_generation roscpp std_msgs)

add_message_files(FILES ControllerOut.msg)
generate_messages(DEPENDENCIES std_msgs)

catkin_package(CATKIN_DEPENDS message_generation message_runtime roscpp std_msgs)

include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(controller_node src/controller_node.cpp)
target_link_libraries(controller_node ${catkin_LIBRARIES})
add_dependencies(controller_node ${controller_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
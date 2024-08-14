cmake_minimum_required(VERSION 3.0.2)
project(imu_parser)

find_package(catkin REQUIRED COMPONENTS
  message_generation
  roscpp
  std_msgs
)

add_message_files(FILES IMUData.msg IMURaw.msg)

generate_messages(DEPENDENCIES std_msgs)

catkin_package(CATKIN_DEPENDS message_generation message_runtime roscpp std_msgs)

include_directories(include ${catkin_INCLUDE_DIRS} ../relay/include)

add_executable(imu_parser_node src/imu_parser_node.cpp)
target_link_libraries(imu_parser_node ${catkin_LIBRARIES})
add_dependencies(imu_parser_node ${imu_parser_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
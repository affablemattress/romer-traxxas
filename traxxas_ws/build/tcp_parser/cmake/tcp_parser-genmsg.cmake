# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "tcp_parser: 1 messages, 0 services")

set(MSG_I_FLAGS "-Itcp_parser:/traxxas_ws/src/tcp_parser/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(tcp_parser_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/traxxas_ws/src/tcp_parser/msg/GPSData.msg" NAME_WE)
add_custom_target(_tcp_parser_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tcp_parser" "/traxxas_ws/src/tcp_parser/msg/GPSData.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(tcp_parser
  "/traxxas_ws/src/tcp_parser/msg/GPSData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tcp_parser
)

### Generating Services

### Generating Module File
_generate_module_cpp(tcp_parser
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tcp_parser
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(tcp_parser_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(tcp_parser_generate_messages tcp_parser_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/traxxas_ws/src/tcp_parser/msg/GPSData.msg" NAME_WE)
add_dependencies(tcp_parser_generate_messages_cpp _tcp_parser_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tcp_parser_gencpp)
add_dependencies(tcp_parser_gencpp tcp_parser_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tcp_parser_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(tcp_parser
  "/traxxas_ws/src/tcp_parser/msg/GPSData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tcp_parser
)

### Generating Services

### Generating Module File
_generate_module_eus(tcp_parser
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tcp_parser
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(tcp_parser_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(tcp_parser_generate_messages tcp_parser_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/traxxas_ws/src/tcp_parser/msg/GPSData.msg" NAME_WE)
add_dependencies(tcp_parser_generate_messages_eus _tcp_parser_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tcp_parser_geneus)
add_dependencies(tcp_parser_geneus tcp_parser_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tcp_parser_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(tcp_parser
  "/traxxas_ws/src/tcp_parser/msg/GPSData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tcp_parser
)

### Generating Services

### Generating Module File
_generate_module_lisp(tcp_parser
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tcp_parser
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(tcp_parser_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(tcp_parser_generate_messages tcp_parser_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/traxxas_ws/src/tcp_parser/msg/GPSData.msg" NAME_WE)
add_dependencies(tcp_parser_generate_messages_lisp _tcp_parser_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tcp_parser_genlisp)
add_dependencies(tcp_parser_genlisp tcp_parser_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tcp_parser_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(tcp_parser
  "/traxxas_ws/src/tcp_parser/msg/GPSData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tcp_parser
)

### Generating Services

### Generating Module File
_generate_module_nodejs(tcp_parser
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tcp_parser
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(tcp_parser_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(tcp_parser_generate_messages tcp_parser_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/traxxas_ws/src/tcp_parser/msg/GPSData.msg" NAME_WE)
add_dependencies(tcp_parser_generate_messages_nodejs _tcp_parser_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tcp_parser_gennodejs)
add_dependencies(tcp_parser_gennodejs tcp_parser_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tcp_parser_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(tcp_parser
  "/traxxas_ws/src/tcp_parser/msg/GPSData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tcp_parser
)

### Generating Services

### Generating Module File
_generate_module_py(tcp_parser
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tcp_parser
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(tcp_parser_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(tcp_parser_generate_messages tcp_parser_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/traxxas_ws/src/tcp_parser/msg/GPSData.msg" NAME_WE)
add_dependencies(tcp_parser_generate_messages_py _tcp_parser_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tcp_parser_genpy)
add_dependencies(tcp_parser_genpy tcp_parser_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tcp_parser_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tcp_parser)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tcp_parser
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(tcp_parser_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tcp_parser)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tcp_parser
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(tcp_parser_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tcp_parser)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tcp_parser
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(tcp_parser_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tcp_parser)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tcp_parser
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(tcp_parser_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tcp_parser)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tcp_parser\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tcp_parser
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(tcp_parser_generate_messages_py std_msgs_generate_messages_py)
endif()

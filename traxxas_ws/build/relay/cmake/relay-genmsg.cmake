# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "relay: 2 messages, 0 services")

set(MSG_I_FLAGS "-Irelay:/traxxas_ws/src/relay/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(relay_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/traxxas_ws/src/relay/msg/RelayState.msg" NAME_WE)
add_custom_target(_relay_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "relay" "/traxxas_ws/src/relay/msg/RelayState.msg" ""
)

get_filename_component(_filename "/traxxas_ws/src/relay/msg/Steer.msg" NAME_WE)
add_custom_target(_relay_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "relay" "/traxxas_ws/src/relay/msg/Steer.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(relay
  "/traxxas_ws/src/relay/msg/RelayState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/relay
)
_generate_msg_cpp(relay
  "/traxxas_ws/src/relay/msg/Steer.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/relay
)

### Generating Services

### Generating Module File
_generate_module_cpp(relay
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/relay
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(relay_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(relay_generate_messages relay_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/traxxas_ws/src/relay/msg/RelayState.msg" NAME_WE)
add_dependencies(relay_generate_messages_cpp _relay_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/traxxas_ws/src/relay/msg/Steer.msg" NAME_WE)
add_dependencies(relay_generate_messages_cpp _relay_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(relay_gencpp)
add_dependencies(relay_gencpp relay_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS relay_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(relay
  "/traxxas_ws/src/relay/msg/RelayState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/relay
)
_generate_msg_eus(relay
  "/traxxas_ws/src/relay/msg/Steer.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/relay
)

### Generating Services

### Generating Module File
_generate_module_eus(relay
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/relay
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(relay_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(relay_generate_messages relay_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/traxxas_ws/src/relay/msg/RelayState.msg" NAME_WE)
add_dependencies(relay_generate_messages_eus _relay_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/traxxas_ws/src/relay/msg/Steer.msg" NAME_WE)
add_dependencies(relay_generate_messages_eus _relay_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(relay_geneus)
add_dependencies(relay_geneus relay_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS relay_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(relay
  "/traxxas_ws/src/relay/msg/RelayState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/relay
)
_generate_msg_lisp(relay
  "/traxxas_ws/src/relay/msg/Steer.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/relay
)

### Generating Services

### Generating Module File
_generate_module_lisp(relay
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/relay
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(relay_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(relay_generate_messages relay_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/traxxas_ws/src/relay/msg/RelayState.msg" NAME_WE)
add_dependencies(relay_generate_messages_lisp _relay_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/traxxas_ws/src/relay/msg/Steer.msg" NAME_WE)
add_dependencies(relay_generate_messages_lisp _relay_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(relay_genlisp)
add_dependencies(relay_genlisp relay_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS relay_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(relay
  "/traxxas_ws/src/relay/msg/RelayState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/relay
)
_generate_msg_nodejs(relay
  "/traxxas_ws/src/relay/msg/Steer.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/relay
)

### Generating Services

### Generating Module File
_generate_module_nodejs(relay
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/relay
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(relay_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(relay_generate_messages relay_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/traxxas_ws/src/relay/msg/RelayState.msg" NAME_WE)
add_dependencies(relay_generate_messages_nodejs _relay_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/traxxas_ws/src/relay/msg/Steer.msg" NAME_WE)
add_dependencies(relay_generate_messages_nodejs _relay_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(relay_gennodejs)
add_dependencies(relay_gennodejs relay_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS relay_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(relay
  "/traxxas_ws/src/relay/msg/RelayState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/relay
)
_generate_msg_py(relay
  "/traxxas_ws/src/relay/msg/Steer.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/relay
)

### Generating Services

### Generating Module File
_generate_module_py(relay
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/relay
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(relay_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(relay_generate_messages relay_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/traxxas_ws/src/relay/msg/RelayState.msg" NAME_WE)
add_dependencies(relay_generate_messages_py _relay_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/traxxas_ws/src/relay/msg/Steer.msg" NAME_WE)
add_dependencies(relay_generate_messages_py _relay_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(relay_genpy)
add_dependencies(relay_genpy relay_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS relay_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/relay)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/relay
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(relay_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/relay)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/relay
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(relay_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/relay)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/relay
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(relay_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/relay)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/relay
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(relay_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/relay)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/relay\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/relay
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(relay_generate_messages_py std_msgs_generate_messages_py)
endif()

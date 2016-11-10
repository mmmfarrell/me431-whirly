# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "whirlybird_msgs: 3 messages, 0 services")

set(MSG_I_FLAGS "-Iwhirlybird_msgs:/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(whirlybird_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Command.msg" NAME_WE)
add_custom_target(_whirlybird_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "whirlybird_msgs" "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Command.msg" ""
)

get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Whirlybird.msg" NAME_WE)
add_custom_target(_whirlybird_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "whirlybird_msgs" "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Whirlybird.msg" ""
)

get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/MyStates.msg" NAME_WE)
add_custom_target(_whirlybird_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "whirlybird_msgs" "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/MyStates.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(whirlybird_msgs
  "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Command.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/whirlybird_msgs
)
_generate_msg_cpp(whirlybird_msgs
  "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Whirlybird.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/whirlybird_msgs
)
_generate_msg_cpp(whirlybird_msgs
  "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/MyStates.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/whirlybird_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(whirlybird_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/whirlybird_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(whirlybird_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(whirlybird_msgs_generate_messages whirlybird_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Command.msg" NAME_WE)
add_dependencies(whirlybird_msgs_generate_messages_cpp _whirlybird_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Whirlybird.msg" NAME_WE)
add_dependencies(whirlybird_msgs_generate_messages_cpp _whirlybird_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/MyStates.msg" NAME_WE)
add_dependencies(whirlybird_msgs_generate_messages_cpp _whirlybird_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(whirlybird_msgs_gencpp)
add_dependencies(whirlybird_msgs_gencpp whirlybird_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS whirlybird_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(whirlybird_msgs
  "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Command.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/whirlybird_msgs
)
_generate_msg_eus(whirlybird_msgs
  "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Whirlybird.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/whirlybird_msgs
)
_generate_msg_eus(whirlybird_msgs
  "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/MyStates.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/whirlybird_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(whirlybird_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/whirlybird_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(whirlybird_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(whirlybird_msgs_generate_messages whirlybird_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Command.msg" NAME_WE)
add_dependencies(whirlybird_msgs_generate_messages_eus _whirlybird_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Whirlybird.msg" NAME_WE)
add_dependencies(whirlybird_msgs_generate_messages_eus _whirlybird_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/MyStates.msg" NAME_WE)
add_dependencies(whirlybird_msgs_generate_messages_eus _whirlybird_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(whirlybird_msgs_geneus)
add_dependencies(whirlybird_msgs_geneus whirlybird_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS whirlybird_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(whirlybird_msgs
  "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Command.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/whirlybird_msgs
)
_generate_msg_lisp(whirlybird_msgs
  "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Whirlybird.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/whirlybird_msgs
)
_generate_msg_lisp(whirlybird_msgs
  "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/MyStates.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/whirlybird_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(whirlybird_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/whirlybird_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(whirlybird_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(whirlybird_msgs_generate_messages whirlybird_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Command.msg" NAME_WE)
add_dependencies(whirlybird_msgs_generate_messages_lisp _whirlybird_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Whirlybird.msg" NAME_WE)
add_dependencies(whirlybird_msgs_generate_messages_lisp _whirlybird_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/MyStates.msg" NAME_WE)
add_dependencies(whirlybird_msgs_generate_messages_lisp _whirlybird_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(whirlybird_msgs_genlisp)
add_dependencies(whirlybird_msgs_genlisp whirlybird_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS whirlybird_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(whirlybird_msgs
  "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Command.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/whirlybird_msgs
)
_generate_msg_nodejs(whirlybird_msgs
  "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Whirlybird.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/whirlybird_msgs
)
_generate_msg_nodejs(whirlybird_msgs
  "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/MyStates.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/whirlybird_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(whirlybird_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/whirlybird_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(whirlybird_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(whirlybird_msgs_generate_messages whirlybird_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Command.msg" NAME_WE)
add_dependencies(whirlybird_msgs_generate_messages_nodejs _whirlybird_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Whirlybird.msg" NAME_WE)
add_dependencies(whirlybird_msgs_generate_messages_nodejs _whirlybird_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/MyStates.msg" NAME_WE)
add_dependencies(whirlybird_msgs_generate_messages_nodejs _whirlybird_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(whirlybird_msgs_gennodejs)
add_dependencies(whirlybird_msgs_gennodejs whirlybird_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS whirlybird_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(whirlybird_msgs
  "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Command.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/whirlybird_msgs
)
_generate_msg_py(whirlybird_msgs
  "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Whirlybird.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/whirlybird_msgs
)
_generate_msg_py(whirlybird_msgs
  "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/MyStates.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/whirlybird_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(whirlybird_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/whirlybird_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(whirlybird_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(whirlybird_msgs_generate_messages whirlybird_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Command.msg" NAME_WE)
add_dependencies(whirlybird_msgs_generate_messages_py _whirlybird_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Whirlybird.msg" NAME_WE)
add_dependencies(whirlybird_msgs_generate_messages_py _whirlybird_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/MyStates.msg" NAME_WE)
add_dependencies(whirlybird_msgs_generate_messages_py _whirlybird_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(whirlybird_msgs_genpy)
add_dependencies(whirlybird_msgs_genpy whirlybird_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS whirlybird_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/whirlybird_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/whirlybird_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(whirlybird_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/whirlybird_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/whirlybird_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(whirlybird_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/whirlybird_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/whirlybird_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(whirlybird_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/whirlybird_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/whirlybird_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(whirlybird_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/whirlybird_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/whirlybird_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/whirlybird_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(whirlybird_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()

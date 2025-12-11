# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "space_invaders_ros: 1 messages, 2 services")

set(MSG_I_FLAGS "-Ispace_invaders_ros:/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(space_invaders_ros_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/msg/user_msg.msg" NAME_WE)
add_custom_target(_space_invaders_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "space_invaders_ros" "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/msg/user_msg.msg" ""
)

get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/GetUserScore.srv" NAME_WE)
add_custom_target(_space_invaders_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "space_invaders_ros" "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/GetUserScore.srv" ""
)

get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/SetGameDifficulty.srv" NAME_WE)
add_custom_target(_space_invaders_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "space_invaders_ros" "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/SetGameDifficulty.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(space_invaders_ros
  "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/msg/user_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/space_invaders_ros
)

### Generating Services
_generate_srv_cpp(space_invaders_ros
  "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/GetUserScore.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/space_invaders_ros
)
_generate_srv_cpp(space_invaders_ros
  "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/SetGameDifficulty.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/space_invaders_ros
)

### Generating Module File
_generate_module_cpp(space_invaders_ros
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/space_invaders_ros
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(space_invaders_ros_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(space_invaders_ros_generate_messages space_invaders_ros_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/msg/user_msg.msg" NAME_WE)
add_dependencies(space_invaders_ros_generate_messages_cpp _space_invaders_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/GetUserScore.srv" NAME_WE)
add_dependencies(space_invaders_ros_generate_messages_cpp _space_invaders_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/SetGameDifficulty.srv" NAME_WE)
add_dependencies(space_invaders_ros_generate_messages_cpp _space_invaders_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(space_invaders_ros_gencpp)
add_dependencies(space_invaders_ros_gencpp space_invaders_ros_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS space_invaders_ros_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(space_invaders_ros
  "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/msg/user_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/space_invaders_ros
)

### Generating Services
_generate_srv_eus(space_invaders_ros
  "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/GetUserScore.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/space_invaders_ros
)
_generate_srv_eus(space_invaders_ros
  "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/SetGameDifficulty.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/space_invaders_ros
)

### Generating Module File
_generate_module_eus(space_invaders_ros
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/space_invaders_ros
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(space_invaders_ros_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(space_invaders_ros_generate_messages space_invaders_ros_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/msg/user_msg.msg" NAME_WE)
add_dependencies(space_invaders_ros_generate_messages_eus _space_invaders_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/GetUserScore.srv" NAME_WE)
add_dependencies(space_invaders_ros_generate_messages_eus _space_invaders_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/SetGameDifficulty.srv" NAME_WE)
add_dependencies(space_invaders_ros_generate_messages_eus _space_invaders_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(space_invaders_ros_geneus)
add_dependencies(space_invaders_ros_geneus space_invaders_ros_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS space_invaders_ros_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(space_invaders_ros
  "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/msg/user_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/space_invaders_ros
)

### Generating Services
_generate_srv_lisp(space_invaders_ros
  "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/GetUserScore.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/space_invaders_ros
)
_generate_srv_lisp(space_invaders_ros
  "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/SetGameDifficulty.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/space_invaders_ros
)

### Generating Module File
_generate_module_lisp(space_invaders_ros
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/space_invaders_ros
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(space_invaders_ros_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(space_invaders_ros_generate_messages space_invaders_ros_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/msg/user_msg.msg" NAME_WE)
add_dependencies(space_invaders_ros_generate_messages_lisp _space_invaders_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/GetUserScore.srv" NAME_WE)
add_dependencies(space_invaders_ros_generate_messages_lisp _space_invaders_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/SetGameDifficulty.srv" NAME_WE)
add_dependencies(space_invaders_ros_generate_messages_lisp _space_invaders_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(space_invaders_ros_genlisp)
add_dependencies(space_invaders_ros_genlisp space_invaders_ros_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS space_invaders_ros_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(space_invaders_ros
  "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/msg/user_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/space_invaders_ros
)

### Generating Services
_generate_srv_nodejs(space_invaders_ros
  "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/GetUserScore.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/space_invaders_ros
)
_generate_srv_nodejs(space_invaders_ros
  "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/SetGameDifficulty.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/space_invaders_ros
)

### Generating Module File
_generate_module_nodejs(space_invaders_ros
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/space_invaders_ros
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(space_invaders_ros_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(space_invaders_ros_generate_messages space_invaders_ros_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/msg/user_msg.msg" NAME_WE)
add_dependencies(space_invaders_ros_generate_messages_nodejs _space_invaders_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/GetUserScore.srv" NAME_WE)
add_dependencies(space_invaders_ros_generate_messages_nodejs _space_invaders_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/SetGameDifficulty.srv" NAME_WE)
add_dependencies(space_invaders_ros_generate_messages_nodejs _space_invaders_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(space_invaders_ros_gennodejs)
add_dependencies(space_invaders_ros_gennodejs space_invaders_ros_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS space_invaders_ros_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(space_invaders_ros
  "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/msg/user_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/space_invaders_ros
)

### Generating Services
_generate_srv_py(space_invaders_ros
  "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/GetUserScore.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/space_invaders_ros
)
_generate_srv_py(space_invaders_ros
  "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/SetGameDifficulty.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/space_invaders_ros
)

### Generating Module File
_generate_module_py(space_invaders_ros
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/space_invaders_ros
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(space_invaders_ros_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(space_invaders_ros_generate_messages space_invaders_ros_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/msg/user_msg.msg" NAME_WE)
add_dependencies(space_invaders_ros_generate_messages_py _space_invaders_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/GetUserScore.srv" NAME_WE)
add_dependencies(space_invaders_ros_generate_messages_py _space_invaders_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/SetGameDifficulty.srv" NAME_WE)
add_dependencies(space_invaders_ros_generate_messages_py _space_invaders_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(space_invaders_ros_genpy)
add_dependencies(space_invaders_ros_genpy space_invaders_ros_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS space_invaders_ros_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/space_invaders_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/space_invaders_ros
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(space_invaders_ros_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/space_invaders_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/space_invaders_ros
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(space_invaders_ros_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/space_invaders_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/space_invaders_ros
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(space_invaders_ros_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/space_invaders_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/space_invaders_ros
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(space_invaders_ros_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/space_invaders_ros)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/space_invaders_ros\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/space_invaders_ros
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(space_invaders_ros_generate_messages_py std_msgs_generate_messages_py)
endif()

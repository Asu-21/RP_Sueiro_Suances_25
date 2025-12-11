# Install script for directory: /mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/space_invaders_ros/msg" TYPE FILE FILES "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/msg/user_msg.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/space_invaders_ros/srv" TYPE FILE FILES
    "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/GetUserScore.srv"
    "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/srv/SetGameDifficulty.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/space_invaders_ros/cmake" TYPE FILE FILES "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/build/space_invaders_ros/catkin_generated/installspace/space_invaders_ros-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/devel/include/space_invaders_ros")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/devel/share/roseus/ros/space_invaders_ros")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/devel/share/common-lisp/ros/space_invaders_ros")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/devel/share/gennodejs/ros/space_invaders_ros")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/devel/lib/python3/dist-packages/space_invaders_ros")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/devel/lib/python3/dist-packages/space_invaders_ros")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/build/space_invaders_ros/catkin_generated/installspace/space_invaders_ros.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/space_invaders_ros/cmake" TYPE FILE FILES "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/build/space_invaders_ros/catkin_generated/installspace/space_invaders_ros-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/space_invaders_ros/cmake" TYPE FILE FILES
    "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/build/space_invaders_ros/catkin_generated/installspace/space_invaders_rosConfig.cmake"
    "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/build/space_invaders_ros/catkin_generated/installspace/space_invaders_rosConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/space_invaders_ros" TYPE FILE FILES "/mnt/d/Uni/3o/Robot_programming/Practical_sessions/catkin_ws/src/space_invaders_ros/package.xml")
endif()


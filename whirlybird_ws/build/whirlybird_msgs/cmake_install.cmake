# Install script for directory: /fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/install")
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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/whirlybird_msgs/msg" TYPE FILE FILES
    "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Whirlybird.msg"
    "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/Command.msg"
    "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/msg/MyStates.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/whirlybird_msgs/cmake" TYPE FILE FILES "/auto/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/build/whirlybird_msgs/catkin_generated/installspace/whirlybird_msgs-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/devel/include/whirlybird_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/devel/share/roseus/ros/whirlybird_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/devel/share/common-lisp/ros/whirlybird_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/devel/share/gennodejs/ros/whirlybird_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/devel/lib/python2.7/dist-packages/whirlybird_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/devel/lib/python2.7/dist-packages/whirlybird_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/auto/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/build/whirlybird_msgs/catkin_generated/installspace/whirlybird_msgs.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/whirlybird_msgs/cmake" TYPE FILE FILES "/auto/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/build/whirlybird_msgs/catkin_generated/installspace/whirlybird_msgs-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/whirlybird_msgs/cmake" TYPE FILE FILES
    "/auto/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/build/whirlybird_msgs/catkin_generated/installspace/whirlybird_msgsConfig.cmake"
    "/auto/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/build/whirlybird_msgs/catkin_generated/installspace/whirlybird_msgsConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/whirlybird_msgs" TYPE FILE FILES "/fsc/rrhodes2/me431/new_whirly/whirlybird_ws/src/whirlybird_msgs/package.xml")
endif()


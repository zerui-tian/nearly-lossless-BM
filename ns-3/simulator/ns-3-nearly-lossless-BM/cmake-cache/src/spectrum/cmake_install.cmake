# Install script for directory: /home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "release")
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

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-spectrum-optimized.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-spectrum-optimized.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-spectrum-optimized.so"
         RPATH "/usr/local/lib:$ORIGIN/:$ORIGIN/../lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/build/lib/libns3.39-spectrum-optimized.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-spectrum-optimized.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-spectrum-optimized.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-spectrum-optimized.so"
         OLD_RPATH "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/build/lib:"
         NEW_RPATH "/usr/local/lib:$ORIGIN/:$ORIGIN/../lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-spectrum-optimized.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ns3" TYPE FILE FILES
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/helper/adhoc-aloha-noack-ideal-phy-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/helper/spectrum-analyzer-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/helper/spectrum-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/helper/tv-spectrum-transmitter-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/helper/waveform-generator-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/aloha-noack-mac-header.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/aloha-noack-net-device.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/constant-spectrum-propagation-loss.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/friis-spectrum-propagation-loss.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/half-duplex-ideal-phy-signal-parameters.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/half-duplex-ideal-phy.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/ism-spectrum-value-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/matrix-based-channel-model.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/microwave-oven-spectrum-value-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/two-ray-spectrum-propagation-loss-model.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/multi-model-spectrum-channel.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/non-communicating-net-device.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/single-model-spectrum-channel.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/spectrum-analyzer.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/spectrum-channel.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/spectrum-converter.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/spectrum-error-model.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/spectrum-interference.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/spectrum-model-300kHz-300GHz-log.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/spectrum-model-ism2400MHz-res1MHz.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/spectrum-model.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/spectrum-phy.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/spectrum-propagation-loss-model.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/spectrum-transmit-filter.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/phased-array-spectrum-propagation-loss-model.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/spectrum-signal-parameters.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/spectrum-value.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/three-gpp-channel-model.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/three-gpp-spectrum-propagation-loss-model.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/trace-fading-loss-model.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/tv-spectrum-transmitter.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/waveform-generator.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/model/wifi-spectrum-value-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/spectrum/test/spectrum-test.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/build/include/ns3/spectrum-module.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/cmake-cache/src/spectrum/examples/cmake_install.cmake")

endif()


# Install script for directory: /home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-stats-optimized.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-stats-optimized.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-stats-optimized.so"
         RPATH "/usr/local/lib:$ORIGIN/:$ORIGIN/../lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/build/lib/libns3.39-stats-optimized.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-stats-optimized.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-stats-optimized.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-stats-optimized.so"
         OLD_RPATH "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/build/lib:"
         NEW_RPATH "/usr/local/lib:$ORIGIN/:$ORIGIN/../lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-stats-optimized.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ns3" TYPE FILE FILES "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/sqlite-output.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ns3" TYPE FILE FILES
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/sqlite-data-output.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/helper/file-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/helper/gnuplot-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/average.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/basic-data-calculators.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/boolean-probe.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/data-calculator.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/data-collection-object.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/data-collector.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/data-output-interface.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/double-probe.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/file-aggregator.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/get-wildcard-matches.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/gnuplot-aggregator.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/gnuplot.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/histogram.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/omnet-data-output.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/probe.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/stats.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/time-data-calculators.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/time-probe.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/time-series-adaptor.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/uinteger-16-probe.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/uinteger-32-probe.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/stats/model/uinteger-8-probe.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/build/include/ns3/stats-module.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/cmake-cache/src/stats/examples/cmake_install.cmake")

endif()


# Install script for directory: /home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-core-optimized.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-core-optimized.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-core-optimized.so"
         RPATH "/usr/local/lib:$ORIGIN/:$ORIGIN/../lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/build/lib/libns3.39-core-optimized.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-core-optimized.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-core-optimized.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-core-optimized.so"
         OLD_RPATH "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/build/lib:"
         NEW_RPATH "/usr/local/lib:$ORIGIN/:$ORIGIN/../lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-core-optimized.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ns3" TYPE FILE FILES
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/int64x64-128.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/example-as-test.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/helper/csv-reader.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/helper/event-garbage-collector.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/helper/random-variable-stream-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/abort.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/ascii-file.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/ascii-test.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/assert.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/attribute-accessor-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/attribute-construction-list.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/attribute-container.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/attribute-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/attribute.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/boolean.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/breakpoint.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/build-profile.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/calendar-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/callback.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/command-line.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/config.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/default-deleter.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/default-simulator-impl.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/deprecated.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/des-metrics.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/double.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/enum.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/event-id.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/event-impl.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/fatal-error.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/fatal-impl.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/fd-reader.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/environment-variable.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/global-value.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/hash-fnv.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/hash-function.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/hash-murmur3.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/hash.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/heap-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/int-to-type.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/int64x64-double.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/int64x64.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/integer.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/length.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/list-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/log-macros-disabled.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/log-macros-enabled.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/log.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/make-event.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/map-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/math.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/names.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/node-printer.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/nstime.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/object-base.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/object-factory.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/object-map.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/object-ptr-container.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/object-vector.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/object.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/pair.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/pointer.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/priority-queue-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/ptr.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/random-variable-stream.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/rng-seed-manager.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/rng-stream.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/show-progress.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/simple-ref-count.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/simulation-singleton.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/simulator-impl.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/simulator.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/singleton.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/string.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/synchronizer.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/system-path.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/system-wall-clock-ms.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/system-wall-clock-timestamp.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/test.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/time-printer.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/timer-impl.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/timer.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/trace-source-accessor.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/traced-callback.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/traced-value.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/trickle-timer.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/tuple.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/type-id.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/type-name.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/type-traits.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/uinteger.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/unused.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/valgrind.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/vector.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/warnings.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/watchdog.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/realtime-simulator-impl.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/wall-clock-synchronizer.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/val-array.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/matrix-array.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/core/model/random-variable.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/build/include/ns3/config-store-config.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/build/include/ns3/core-config.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/build/include/ns3/core-module.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/cmake-cache/src/core/examples/cmake_install.cmake")

endif()


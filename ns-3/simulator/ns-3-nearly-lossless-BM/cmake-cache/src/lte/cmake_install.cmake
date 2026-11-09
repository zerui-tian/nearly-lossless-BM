# Install script for directory: /home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-lte-optimized.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-lte-optimized.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-lte-optimized.so"
         RPATH "/usr/local/lib:$ORIGIN/:$ORIGIN/../lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/build/lib/libns3.39-lte-optimized.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-lte-optimized.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-lte-optimized.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-lte-optimized.so"
         OLD_RPATH "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/build/lib:"
         NEW_RPATH "/usr/local/lib:$ORIGIN/:$ORIGIN/../lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.39-lte-optimized.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ns3" TYPE FILE FILES
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/helper/emu-epc-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/helper/cc-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/helper/epc-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/helper/lte-global-pathloss-database.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/helper/lte-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/helper/lte-hex-grid-enb-topology-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/helper/lte-stats-calculator.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/helper/mac-stats-calculator.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/helper/no-backhaul-epc-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/helper/phy-rx-stats-calculator.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/helper/phy-stats-calculator.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/helper/phy-tx-stats-calculator.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/helper/point-to-point-epc-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/helper/radio-bearer-stats-calculator.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/helper/radio-bearer-stats-connector.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/helper/radio-environment-map-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/a2-a4-rsrq-handover-algorithm.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/a3-rsrp-handover-algorithm.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/component-carrier-enb.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/component-carrier-ue.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/component-carrier.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/cqa-ff-mac-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/epc-enb-application.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/epc-enb-s1-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/epc-gtpc-header.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/epc-gtpu-header.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/epc-mme-application.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/epc-pgw-application.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/epc-s11-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/epc-s1ap-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/epc-sgw-application.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/epc-tft-classifier.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/epc-tft.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/epc-ue-nas.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/epc-x2-header.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/epc-x2-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/epc-x2.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/eps-bearer-tag.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/eps-bearer.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/fdbet-ff-mac-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/fdmt-ff-mac-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/fdtbfq-ff-mac-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/ff-mac-common.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/ff-mac-csched-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/ff-mac-sched-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/ff-mac-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-amc.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-anr-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-anr.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-as-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-asn1-header.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ccm-mac-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ccm-rrc-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-chunk-processor.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-common.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-control-messages.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-enb-cmac-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-enb-component-carrier-manager.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-enb-cphy-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-enb-mac.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-enb-net-device.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-enb-phy-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-enb-phy.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-enb-rrc.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ffr-algorithm.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ffr-distributed-algorithm.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ffr-enhanced-algorithm.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ffr-rrc-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ffr-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ffr-soft-algorithm.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-fr-hard-algorithm.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-fr-no-op-algorithm.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-fr-soft-algorithm.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-fr-strict-algorithm.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-handover-algorithm.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-handover-management-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-harq-phy.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-interference.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-mac-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-mi-error-model.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-net-device.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-pdcp-header.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-pdcp-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-pdcp-tag.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-pdcp.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-phy-tag.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-phy.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-radio-bearer-info.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-radio-bearer-tag.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-rlc-am-header.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-rlc-am.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-rlc-header.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-rlc-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-rlc-sdu-status-tag.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-rlc-sequence-number.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-rlc-tag.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-rlc-tm.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-rlc-um.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-rlc.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-rrc-header.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-rrc-protocol-ideal.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-rrc-protocol-real.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-rrc-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-spectrum-phy.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-spectrum-signal-parameters.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-spectrum-value-helper.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ue-ccm-rrc-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ue-cmac-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ue-component-carrier-manager.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ue-cphy-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ue-mac.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ue-net-device.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ue-phy-sap.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ue-phy.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ue-power-control.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-ue-rrc.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/lte-vendor-specific-parameters.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/no-op-component-carrier-manager.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/no-op-handover-algorithm.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/pf-ff-mac-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/pss-ff-mac-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/rem-spectrum-phy.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/rr-ff-mac-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/simple-ue-component-carrier-manager.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/tdbet-ff-mac-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/tdmt-ff-mac-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/tdtbfq-ff-mac-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/src/lte/model/tta-ff-mac-scheduler.h"
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/build/include/ns3/lte-module.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-nearly-lossless-BM/cmake-cache/src/lte/examples/cmake_install.cmake")

endif()


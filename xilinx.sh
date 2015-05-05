#!/bin/bash
XILINX_BASE="/usr/local/Xilinx134"
XILINX_VERSION="13.4"
DISPLAY=:0
export XIL_IMPACT_USE_LIBUSB=1
# export LD_PRELOAD="/usr/lib64/libstdc++.so.6 ~/Xilinx134/13.7/ISE_DS/common/lib/lin/libusb-driver.so"
#export LD_PRELOAD=~/Xilinx/14.7/ISE_DS/common/lib/lin64/libusb-driver.so
#emulate sh
export XILINXD_LICENSE_FILE="2100@srv-gei-ens1"
export LM_LICENSE_FILE="2100@srv-gei-ens1"
source ${XILINX_BASE}/${XILINX_VERSION}/ISE_DS/settings32.sh
# Bug in frequency
export LC_NUMERIC=en_US.UTF-8

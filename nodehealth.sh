#!/bin/bash

####################
# Author: Yasaswini Majety
# Date: 03/11/2025
#
# This script outputs the node health
# Version: v1
####################

echo "Print the disk space"
df -h

echo "Print the memory"
if command -v free &> /dev/null; then
    free -g
else
    vm_stat | awk 'NR==2 {print $3*4096/1024/1024 " GB available"}'
fi

echo "Print the CPU"
if command -v nproc &> /dev/null; then
    nproc
else
    sysctl -n hw.ncpu
fi


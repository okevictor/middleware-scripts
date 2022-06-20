#!/bin/bash

  #Author: Victor
  #Date: 06/19/2022

#This script is intended to carryout server inventory

echo "sever inventory status is shown below"

whoami

echo "..................................."

pwd

echo "............................."

cal
echo ".........................."

uptime

echo "..............................."

lscpu
echo "..............................."
nproc
echo "..............................."
lsblk
echo "..............................."
arch
echo "..............................."
uname -a
echo "..............................."
cat /etc/os-release
echo "..............................."
#iostat
echo "..............................."
ifconfig | grep inet
echo "..............................."


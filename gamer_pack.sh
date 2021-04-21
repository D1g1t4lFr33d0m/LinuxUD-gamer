#!/bin/bash

sudo dpkg --add-architecture i386
sudo add-apt-repository ppa:oibaf/graphics-drivers
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update
sudo apt install inxi


kartaGraficzna=`inxi -G | grep -c 'Radeon'`

if [ $kartaGraficzna -lt 1 ]
then
 echo "Nvidia"
 sudo apt install nvidia-driver-435
 sudo apt install libgl1-mesa-dri:i386 libgl1-mesa-glx:i386
else
 echo "Radeon"
 sudo apt install libvulkan1 vulkan-tools vulkan-utils
 sudo apt install mesa-utils
fi
sudo apt install wine64
sudo apt-get install lutris
sudo apt install steam

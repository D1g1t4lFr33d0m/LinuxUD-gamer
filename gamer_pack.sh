#!/bin/bash

sudo dpkg --add-architecture i386
sudo add-apt-repository ppa:oibaf/graphics-drivers
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt -y update
sudo apt -y install inxi


kartaGraficzna=`inxi -G | grep -c 'Radeon'`

if [ $kartaGraficzna -lt 1 ]
then
 echo "Nvidia"
 sudo apt -y install nvidia-driver-435
 sudo apt -y install libgl1-mesa-dri:i386 libgl1-mesa-glx:i386
else
 echo "Radeon"
 sudo apt -y install libvulkan1 vulkan-tools vulkan-utils
 sudo apt -y install mesa-utils
fi
sudo apt -y install wine64
sudo apt-get -y install lutris
sudo apt -y install steam

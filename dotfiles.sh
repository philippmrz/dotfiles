#!/bin/bash
#Check for root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

#Pipe sudo dpkg status to /dev/null
dpkg -s sudo 2>/dev/null
#Use previous command to check if sudo is installed
if [  $? -ne 0 ]; then
   echo "Sudo not installed, want to install sudo? (y/n)"
   read
   if [ "$REPLY" = "y" ]; then
      apt install sudo
   fi
fi

#Install various apps
echo "Install vim? (y/n)"
if [ "$REPLY" = "y" ]; then
   apt install vim
fi

echo "Install feh? (y/n)"
read
if [ "$REPLY" = "y" ]; then
   apt install feh
fi

echo "Install rofi? (y/n)"
if [ "$REPLY" = "y" ]; then
   apt install rofi 
fi

echo "Install compton? (y/n)"
read
if [ "$REPLY" = "y" ]; then
   apt install compton 
fi

echo "Install rxvt? (y/n)"
read
if [ "$REPLY" = "y" ]; then
   apt install rxvt-unicode-256color 
fi

echo "Install git? (y/n)"
read
if [ "$REPLY" = "y" ]; then
   apt install git
fi

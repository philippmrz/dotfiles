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
read
if [ "$REPLY" = "y" ]; then
   apt install vim
fi

echo "Install feh? (y/n)"
read
if [ "$REPLY" = "y" ]; then
   apt install feh
fi

echo "Install rofi? (y/n)"
read
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

echo "Install i3? (y/n)"
read
if [ "$REPLY" = "y" ]; then
   apt install i3 
fi

if [ ! -d "$HOME/.config" ]; then
   mkdir $HOME/.config
fi

if [ -f $HOME/.bashrc ]; then
   rm $HOME/.bashrc
fi

rm /home/phil/.bashrc
rm /home/phil/.vimrc
rm /home/phil/.Xresources

ln -s /home/phil/Dotfiles/i3 /home/phil/.config/i3
ln -s /home/phil/Dotfiles/X/Xresources /home/phil/.Xresources
ln -s /home/phil/Dotfiles/Bash/bashrc /home/phil/.bashrc
ln -s /home/phil/Dotfiles/Vim/vim /home/phil/.vim
ln -s /home/phil/Dotfiles/Vim/vimrc home/phil/.vimrc
ln -s /home/phil/Dotfiles/vscode/keybindings.json /home/phil/.config/Code/User/keybindings.json
ln -s /home/phil/Dotfiles/vscode/settings.json /home/phil/.config/Code/User/settings.json

echo "Dont forget to symlink X/30-touchpad.conf in /etc/X11/xorg.conf.d"

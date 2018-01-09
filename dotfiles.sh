#!/bin/bash
echo 'Tap enter for the programs you want to install'
echo 'i3WM: ' && read i3
echo $i3
if [ "$i3" = 'y' ]
then 
  install='i3'
  echo "Added i3wm"
fi

echo 'dunst: ' && read dunst
if [ "$dunst" = 'y' ]
then
  install="$install dunst"
  echo 'Added dunst'
fi

echo 'compton, feh & rofi: ' && read i3otherstuff
if [ "$i3otherstuff" = 'y' ]
then
  install="$install compton feh rofi"
  echo 'Added compton, rofi and feh'
fi

echo "You want to install: $install"
read

if [ "command -v sudo" = '' ]
then
  echo 'Sudo not installed, install to continue'
  exit
fi

sudo apt install $install

rm -rf ~/.bashrc ~/.config/i3 ~/.vim 
ln -s ~/Dotfiles/Bash/bashrc ~/.bashrc
ln -s ~/Dotfiles/Vim/vim ~/.vim
ln -s ~/Dotfiles/Vim/vimrc ~/.vimrc
ln -s ~/Dotfiles/X/Xresources ~/.Xresources
ln -s ~/Dotfiles/i3 ~/.config/i3
mkdir ~/.config/dunst
ln -s ~/Dotfiles/dunst/dunstrc ~/.config/dunst/

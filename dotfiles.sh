#!/bin/bash
echo 'This script takes your dotfile repo and symlinks the important stuff into your home directory.'
echo 'It also installs programs like git, i3, dunst, compton, vim etc.'
echo 'Feel free to clone and tweak for your own needs'
if [ "command -v sudo" = '' ]
then
  echo 'Sudo not installed, install to continue'
  exit
fi

echo 'Installing git'
apt install git
echo 'Enter username and email for git config:'
echo 'user.name: ' && read gitname
"git config --global user.name '$gitname'"
echo 'user.email: ' && read gitemail
"git config --global user.email '$gitemail'"
cd ~
echo 'Enter repo user and dotfile name'
echo 'Repo user: ' && read repouser
echo 'Repo name: ' && read reponame
git clone https://www.github.com/$repouser/$reponame

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

if [ $EUID -ne 0]
then
  echo 'Not root, run as root to continue'
  exit
fi

apt install vim $install


rm -rf ~/.bashrc ~/.config/i3 ~/.vim 
ln -s ~/Dotfiles/Bash/bashrc ~/.bashrc
ln -s ~/Dotfiles/Vim/vim ~/.vim
ln -s ~/Dotfiles/Vim/vimrc ~/.vimrc
ln -s ~/Dotfiles/X/Xresources ~/.Xresources
ln -s ~/Dotfiles/i3 ~/.config/i3
mkdir ~/.config/dunst
ln -s ~/Dotfiles/dunst/dunstrc ~/.config/dunst/

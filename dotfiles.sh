<<<<<<< HEAD
=======
mkdir Dotfiles
cd Dotfiles
git init
git pull https://github.com/phmrz/dotfiles.git
>>>>>>> 089746bf99f6a363f679dbc39e27b1cde320f3a4
rm -rf ~/.bashrc ~/.config/i3 ~/.vim 
ln -s ~/Dotfiles/Bash/bashrc ~/.bashrc
ln -s ~/Dotfiles/Vim/vim ~/.vim
ln -s ~/Dotfiles/Vim/vimrc ~/.vimrc
ln -s ~/Dotfiles/X/Xresources ~/.Xresources
ln -s ~/Dotfiles/i3 ~/.config/i3
ln -s ~/Dotfiles/i3status ~/.config/i3status

#!/bin/bash

echo Creating Symbolic Links

mkdir -p ~/.config/nvim

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim

if test -d /path/to/directory; then
    echo creating nvim link
  ln -s ~/dotfiles/nvim ~/.config/nvim
fi

ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases


#!/bin/bash

echo Creating Symbolic Links

mkdir -p ~/.config/nvim

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/nvim ~/.config/nvim


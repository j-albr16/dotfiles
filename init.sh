#!/bin/bash


echo 'Initialize Dotfile Configuration'

git clone https://github.com/j-albr16/dotfiles.git ~/dotfiles && bash ~/dotfiles/symlink.sh

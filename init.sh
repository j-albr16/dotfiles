#!/bin/bash


echo 'Initialize Dotfile Configuration'

git clone https://github.com/j-albr16/dotfiles.git ~/dotfiles && cd dotfiles && bash symlink.sh && bash set-ssh-origin.sh

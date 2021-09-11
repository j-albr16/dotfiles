#!/bin/bash


echo Checking for SSH Key

ssh -L git@github.com

echo Setting new Origin to git@github.com:j-albr16/dotfiles.com

git remote set-url origin git@github.com:j-albr16/dotfiles.git

echo Next call git push --set-upstream origin


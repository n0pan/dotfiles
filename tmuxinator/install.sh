#!/bin/bash

echo "installing tmuxinator"
cp -f ./tmuxinator.zsh ~/.bin/tmuxinator.zsh
cp -rf ./*.yml ~/.config/tmuxinator
echo "done!"

#!/bin/bash

echo "Installing neofetch configuration"
rm -rf ~/.config/neofetch

mkdir ~/.config/neofetch
ln -sf ~/dotfiles/neofetch/config.conf ~/.config/neofetch/config.conf
ln -sf ~/dotfiles/neofetch/logo ~/.config/neofetch/logo

echo "Done!"

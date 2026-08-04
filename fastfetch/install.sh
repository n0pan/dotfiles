#!/bin/bash

echo "Installing fastfetch configuration"
rm -rf ~/.config/fastfetch

mkdir ~/.config/fastfetch
ln -sf ~/dotfiles/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
ln -sf ~/dotfiles/fastfetch/logo.txt ~/.config/fastfetch/logo.txt

echo "Done!"

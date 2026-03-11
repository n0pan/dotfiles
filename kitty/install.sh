#!/bin/bash

echo "installing kitty configuration"
rm -rf ~/.config/kitty
ln -sf ~/dotfiles/kitty ~/.config/kitty
echo "done!"

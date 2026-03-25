#!/bin/bash

echo "installing neovim configuration"
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim

mkdir ~/.config/nvim
ln -sf ~/dotfiles/neovim/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/neovim/lua ~/.config/nvim/lua

nvim --headless "+Lazy! sync" +qa
echo "done!"

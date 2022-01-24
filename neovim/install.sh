#!/bin/sh

echo "installing neovim configuration"
ln -sf ~/dotfiles/neovim/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/neovim/lua ~/.config/nvim/lua
echo "done!"

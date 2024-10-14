#!/bin/sh

echo "installing rustup..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "installing neovim..."
npm install --global neovim
pip2 install pynvim --break-system-packages
pip3 install pynvim --break-system-packages

echo "install powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH/themes/powerlevel10k

echo "install tpm..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "copy .config"
cp -R ~/dotfiles/.config/ ~/.config/

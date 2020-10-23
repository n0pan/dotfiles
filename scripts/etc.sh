#!/bin/sh

echo "installing rustup..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "installing neovim..."
npm install neovim
pip2 install pynvim
pip3 install pynvim

echo "install ligaturizer..."
git clone https://github.com/ToxicFrog/Ligaturizer.git --recurse-submodules ~/Ligaturizer

echo "install meteor..."
curl https://install.meteor.com/ | sh

echo "install powerlevel10k..."
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo "install tpm..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


echo "copy .config"
cp -R ~/dotfiles/.config/ ~/.config/

echo "copy .bin"
cp -R ~/dotfiles/.bin/ ~/.bin/

#!/bin/sh

# Install neovim
npm install neovim
pip3 install --user neovim

# Clone Ligaturizer
git clone https://github.com/ToxicFrog/Ligaturizer.git --recurse-submodules ~/Ligaturizer

# Install meteor
curl https://install.meteor.com/ | sh

# Install powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Clone TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp -R ~/dotfiles/.config/ ~/.config/
cp -R ~/dotfiles/.bin/ ~/.bin/

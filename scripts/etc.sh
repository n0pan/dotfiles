#!/bin/sh

echo "installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "install powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${HOME}/.oh-my-zsh/themes/powerlevel10k"

echo "installing rustup..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

echo "installing neovim providers..."
npm install --global neovim
pip3 install pynvim --break-system-packages

echo "install tpm..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm



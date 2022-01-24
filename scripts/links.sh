#!/bin/sh

echo "making links..."

source ~/dotfiles/yabai/install.sh
source ~/dotfiles/zsh/install.sh
source ~/dotfiles/tmux/install.sh
source ~/dotfiles/neovim/install.sh
source ~/dotfiles/kitty/install.sh

echo "linking spotify-tui config"
ln -sf ~/dotfiles/spotify-tui/client.yml ~/.config/spotify-tui/client.yml
ln -sf ~/dotfiles/spotify-tui/config.yml ~/.config/spotify-tui/config.yml
echo "done!"

echo "linking spotifyd"
mkdir ~/.config/spotifyd
ln -sf ~/dotfiles/.config/spotifyd/spotifyd.conf ~/.config/spotifyd/spotifyd.conf
echo "done!"

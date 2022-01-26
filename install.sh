#!/bin/bash

source ./scripts/brew.sh
source ./scripts/cask.sh
source ./scripts/links.sh
source ./scripts/etc.sh
source ./tmuxinator/install.sh
source ./fonts/install.sh
source ./wallpapers/install.sh
source ./gitconfig/install.sh
source ./mac/macos.sh

echo "Sourcing zshrc"
source ./zsh/.zshrc
tmux source ./tmux/.tmux.conf

echo "Installation complete!"

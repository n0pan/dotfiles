#!/bin/bash

cd "$(dirname "$0")"

echo "NOTE: PragmataPro Mono Liga is the primary Kitty font and must be installed manually (paid font)."
echo ""

echo "Initializing git submodules..."
git submodule update --init --recursive

echo "Symlinking ~/workfiles..."
ln -sf ~/dotfiles/workfiles ~/workfiles

source ./scripts/brew.sh
source ./scripts/cask.sh
source ./scripts/links.sh
source ./scripts/etc.sh
source ./tmuxinator/install.sh
source ./fonts/install.sh
source ./wallpapers/install.sh
source ./gitconfig/install.sh
source ./mac/macos.sh

tmux source ./tmux/.tmux.conf 2>/dev/null || true

echo "Installation complete!"
echo "NOTE: Open a new shell to load zsh configuration."

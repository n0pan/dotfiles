#!/bin/sh

if ! command -v brew >/dev/null 2>&1; then
  echo "No Homebrew found. Installing now..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing packages from Brewfile..."
brew update
brew bundle --file ~/dotfiles/Brewfile
brew cleanup

echo "Installing bun..."
curl -fsSL https://bun.sh/install | bash

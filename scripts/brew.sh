#!/bin/sh

# Check for homebrew and install if needed
echo "Installing homebrew"

which -s brew
if [ "$?" -ne 0 ]; then
   echo "No Homebrew found. Installing now..."
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

# Shell
echo "Installing shell tools..."
brew install zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions

# Git
echo "Installing Git..."
brew install git
brew install gh

# Languages / runtimes
echo "Installing languages and runtimes..."
brew install python3
brew install node
brew install n
brew install openjdk
brew install go
brew install awscli

# Terminal / editor
echo "Installing terminal tools..."
brew install cmake
brew install luarocks
brew install pkgconf
brew install neovim
brew install tmux
brew install the_silver_searcher
brew install docker-compose
brew install tmuxinator
brew install fd
brew install ripgrep

# Utilities
echo "Installing utilities..."
brew install mas
brew install neofetch
brew install fontforge
brew install opencode

brew cleanup

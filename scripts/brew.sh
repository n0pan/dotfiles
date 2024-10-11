#!/bin/sh

# Check for homebrew and install if needed
echo "Installing homebrew"

which -s brew
if [ "$?" -ne 0 ]; then
   echo "No Homebrew found. Installing now..."
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

# Install ZSH
echo "Installing ZSH..."
brew install zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions

ln -s ~/dotfiles/.

# Git
echo "Installing Git..."
brew install git
brew install gh

# Development
echo "Installing Development..."
brew install python
brew install python3
brew install node
brew install java
brew install golang
brew install awscli

# Terminal
echo "Installing terminal..."
brew install cmake
brew install luarocks
brew install pkg-config
brew install neovim
brew install tmux
brew install the_silver_searcher
brew install docker-compose
brew install tmuxinator
brew install fd
brew install ripgrep

# Tools
echo "Installing Tools..."
brew install mas
brew install neofetch
brew install fontforge

brew cleanup

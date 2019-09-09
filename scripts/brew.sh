#!/bin/sh

# Check for homebrew and install if needed
echo "Installing homebrew"

which -s brew
if [[ $? != 0 ]] ; then
  yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew already installed ..."
fi

brew update

# Install ZSH
echo "Installing ZSH..."
brew install zsh

# Git
echo "Installing Git..."
brew install git

# Development
echo "Installing Development..."
brew install python
brew install python3
brew install node
brew install java

brew tap mongodb/brew

brew install mongodb

brew tap prisma/prisma
brew install prisma

# Terminal
echo "Installing terminal..."
brew install cmake
brew install luarocks
brew install pkg-config
brew install --HEAD neovim
brew install tmux
brew install the_silver_searcher

# Music
echo "Installing Spicetify..."
brew install khanhas/tap/spicetify-cli

# Tools
echo "Installing Tools..."
brew install mas
brew install neofetch
brew install fontforge

brew cleanup

#!/bin/sh

# Check for homebrew and install if needed
echo "Installing homebrew"

which -s brew
if [ "$?" -ne 0 ]; then
   echo "No Homebrew found. Installing now..."
   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
brew tap mongodb/brew
brew install mongodb/brew/mongocli
brew install mongodb/brew/mongocommunity
brew install mongodb/brew/mongo-database-tools
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

echo "Installing Spotify tool for terminal..."
brew install Rigellute/tap/spotify-tui
brew install spotifyd

# Tools
echo "Installing Tools..."
brew install mas
brew install neofetch
brew install fontforge

brew cleanup

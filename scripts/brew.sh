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
brew install lazygit

# Languages / runtimes
echo "Installing languages and runtimes..."
brew install python3
brew install node
brew install n
brew install openjdk
brew install go
brew install deno
brew install awscli
brew install azure-cli
brew install yarn
brew install pnpm
brew install uv
brew install cocoapods

# Terminal / editor
echo "Installing terminal tools..."
brew install cmake
brew install luarocks
brew install pkgconf
brew install neovim
# 2026-07-07: 3.7 shipped a TUI render regression and a tmux@3.6b pin was built
# in a private lq/local tap. The pin was keg-only so it never linked, 3.7b has
# been in use ever since, and the tap has been removed. Track core again.
brew install tmux
brew install the_silver_searcher
brew install docker-compose
brew install tmuxinator
brew install fd
brew install ripgrep

# Utilities
echo "Installing utilities..."
brew install mas
brew install fastfetch
brew install fontforge
brew install anomalyco/tap/opencode
brew install fzf
brew install pyenv
brew install tea
brew install tmate
brew install direnv

# Containers / infra
echo "Installing container and infra tools..."
brew install colima
brew install pulumi/tap/pulumi

brew cleanup

# Bun
echo "Installing bun..."
curl -fsSL https://bun.sh/install | bash

#!/bin/bash

brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

echo "installing zsh and p10k"
ln -sf ~/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
echo "done!"


#!/bin/bash

echo "settings up gitconfig"
ln -sf ~/dotfiles/gitconfig/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/gitconfig/.gitignore_global ~/.gitignore_global
echo "done!"

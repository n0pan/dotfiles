#!/bin/bash

echo "setting up zsh, p10k, env, aliases and functions..."
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
ln -sf ~/dotfiles/zsh/env.zsh ~/.env.zsh
ln -sf ~/dotfiles/zsh/aliases.zsh ~/.aliases.zsh
ln -sf ~/dotfiles/zsh/functions.zsh ~/.functions.zsh
echo "done!"


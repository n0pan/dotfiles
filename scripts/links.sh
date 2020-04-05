#!/bin/sh

echo "Making links..."

# Snippets
echo "Snippets..."
ln -s ~/dotfiles/.config/coc/ultisnips/javascriptreact.snippets ~/.config/coc/ultisnips
echo "Done!"

# Tmux
echo "Tmux..."
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
echo "Done!"

# Nvim Config
echo "Neovim config..."
ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
echo "Done!"

# Nvim themes
echo "Linking themes..."
ln -s ~/dotfiles/.config/nvim/colors ~/.config/nvim
echo "Done!"

# zshrc
echo "zshrc..."
ln -s ~/dotfiles/zshrc/.zshrc ~/.zshrc
echo "Done!"

# p10k
echo "powerlevel10k"
ln -s ~/dotfiles/p10k/.p10k.zsh ~/.p10k.zsh
echo "Done!"

#alacritty
echo "alacritty"
ln -s ~/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
echo "Done!"

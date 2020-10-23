#!/bin/sh

echo "making links..."

# Snippets
echo "linking snippets..."
ln -s ~/dotfiles/.config/coc/ultisnips/javascriptreact.snippets ~/.config/coc/ultisnips
echo "done!"

# Tmux
echo "linking tmux conf..."
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
echo "done!"

# Nvim Config
echo "linking nvim config..."
ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
echo "done!"

# Nvim themes
echo "linking themes..."
ln -s ~/dotfiles/.config/nvim/colors ~/.config/nvim
echo "done!"

# zshrc
echo "linking zshrc..."
ln -s ~/dotfiles/zshrc/.zshrc ~/.zshrc
echo "done!"

# p10k
echo "linking powerlevel10k"
ln -s ~/dotfiles/p10k/.p10k.zsh ~/.p10k.zsh
echo "done!"

#alacritty
echo "linking alacritty"
ln -s ~/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
echo "done!"

echo "linking spotify-tui config"
ln -s ~/dotfiles/.config/spotify-tui/client.yml ~/.config/spotify-tui/client.yml
echo "done!"

echo "linking spotifyd"
mkdir ~/.config/spotifyd
ln -s ~/dotfiles/.config/spotifyd/spotifyd.conf ~/.config/spotifyd/spotifyd.conf
echo "done!"

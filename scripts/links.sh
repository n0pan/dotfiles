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

# Copying transparent theme
echo "Copying transparent theme"
cp ~/dotfiles/transparent.vim ~/.config/nvim/vim-airline-themes/autoload/airline/themes/transparent.vim

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

#alacritty
echo "linking window manager"
ln -s ~/dotfiles/.yabairc ~/.yabairc
ln -s ~/dotfiles/.skhdrc ~/.skhdrc
echo "done!"

echo "linking spotify-tui config"
ln -s ~/dotfiles/.config/spotify-tui/client.yml ~/.config/spotify-tui/client.yml
ln -s ~/dotfiles/.config/spotify-tui/config.yml ~/.config/spotify-tui/config.yml
echo "done!"

echo "linking spotifyd"
mkdir ~/.config/spotifyd
ln -s ~/dotfiles/.config/spotifyd/spotifyd.conf ~/.config/spotifyd/spotifyd.conf
echo "done!"

#!/bin/sh

echo "making links..."

# Snippets
echo "linking snippets..."
ln -s -f ~/dotfiles/snippets/javascriptreact.snippets ~/.config/nvim/vim-react-snippets/UltiSnips
ln -s -f ~/dotfiles/snippets/typescriptreact.snippets ~/.config/nvim/vim-react-snippets/UltiSnips
echo "done!"

# Tmux
echo "linking tmux conf..."
ln -s -f ~/dotfiles/terminal/.tmux.conf ~/.tmux.conf
echo "done!"

# Nvim Config
# echo "linking nvim config..."
# ln -s -f ~/dotfiles/terminal/init.vim ~/.config/nvim/init.vim
# echo "done!"

# Neovim config
echo "Linking neovim configuration"
ln -sf ~/dotfiles/terminal/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/terminal/lua ~/.config/nvim/lua
echo "done!"

# Copying transparent theme
echo "Copying transparent theme"
cp ~/dotfiles/terminal/transparent.vim ~/.config/nvim/vim-airline-themes/autoload/airline/themes/transparent.vim

# zshrc
echo "linking zshrc..."
ln -s -f ~/dotfiles/terminal/.zshrc ~/.zshrc
echo "done!"

# kitty
echo "linking kitty.conf"
ln -s -f ~/dotfiles/terminal/kitty.conf ~/.config/kitty/kitty.conf

# p10k
echo "linking powerlevel10k"
ln -s -f ~/dotfiles/terminal/.p10k.zsh ~/.p10k.zsh
echo "done!"

#alacritty
echo "linking window manager"
ln -s -f ~/dotfiles/terminal/.yabairc ~/.yabairc
ln -s -f ~/dotfiles/terminal/.skhdrc ~/.skhdrc
echo "done!"

echo "linking spotify-tui config"
ln -s -f ~/dotfiles/spotify-tui/client.yml ~/.config/spotify-tui/client.yml
ln -s -f ~/dotfiles/spotify-tui/config.yml ~/.config/spotify-tui/config.yml
echo "done!"

echo "linking spotifyd"
mkdir ~/.config/spotifyd
ln -s -f ~/dotfiles/.config/spotifyd/spotifyd.conf ~/.config/spotifyd/spotifyd.conf
echo "done!"

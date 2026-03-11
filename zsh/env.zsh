# PATH — core
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/bin:$PATH"
export PATH="/usr/local/opt/docker-virtualbox/bin:$PATH"

# Shell
export TERM="xterm-256color"
export EDITOR='nvim'

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="powerlevel10k/powerlevel10k"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pipx
export PATH="$PATH:/Users/lq/.local/bin"

# opencode
export PATH=/Users/lq/.opencode/bin:$PATH

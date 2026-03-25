if [ "$TMUX" = "" ]; then tmux; fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.env.zsh

if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="no-cursor"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi

# Setting default_user
DEFAULT_USER=$(whoami)

plugins=(
  git 
  colored-man-pages 
  colorize 
  pip 
  brew 
)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=204"

source ~/.aliases.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.functions.zsh

source ~/.bin/tmuxinator.zsh

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# bun completions
[ -s "/Users/lq/.bun/_bun" ] && source "/Users/lq/.bun/_bun"

if [ -f ~/dotfiles/workfiles/.zshrc.work ]; then
    source ~/dotfiles/workfiles/.zshrc.work
fi

source $ZSH/oh-my-zsh.sh

# Plugins — must be sourced last; zsh-syntax-highlighting must be final
HOMEBREW_PREFIX=$(brew --prefix)
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source ~/dotfiles/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/lq/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="chris"

plugins=(git ruby vi-mode)

source $ZSH/oh-my-zsh.sh

bindkey '^?' backward-delete-char

export PATH=~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

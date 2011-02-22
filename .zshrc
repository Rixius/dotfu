export EDITOR=vim

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="chris"

plugins=(git ruby vi-mode)

source $ZSH/oh-my-zsh.sh

bindkey '^?' backward-delete-char

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

function authme {
  ssh $@ 'cat >>.ssh/authorized_keys' < ~/.ssh/id_rsa.pub
}

function tm {
  tmux attach || tmux
}

export PATH=~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

unsetopt auto_name_dirs
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

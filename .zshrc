
export DOTFU=$HOME/src/.fu
export EDITOR="vim"

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

source $DOTFU/include.zsh/path.sh
source $DOTFU/include.zsh/alias.sh
source $DOTFU/include.zsh/prompt.sh

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

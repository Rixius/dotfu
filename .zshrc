
export DOTFU=/home/rixius/src/.fu
export EDITOR="vim"

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

source $DOTFU/include/path.sh
source $DOTFU/include/alias.sh
source $DOTFU/include/prompt.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

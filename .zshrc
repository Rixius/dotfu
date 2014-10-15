
export DOTFU=$HOME/src/dotfu
export EDITOR="vim"

source $DOTFU/include/colors.sh
source $DOTFU/include/path.sh
source $DOTFU/include/alias.sh
source $DOTFU/include/prompt.z.sh
source $DOTFU/include/input.z.sh

# COMPLETION SETTINGS
# add custom completion scripts
fpath=($DOTFU/functions $fpath) 
 
# compsys initialization
autoload -U compinit
compinit
 
# show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2

if [ -d $HOME/.rvm ]; then
    source $HOME/.rvm/scripts/rvm
    PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

unset GNOME_KEYRING_CONTROL

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


export DOTFU=$HOME/src/.fu
export EDITOR="vim"

source $DOTFU/include/colors.sh
source $DOTFU/include/path.sh
source $DOTFU/include/alias.sh
source $DOTFU/include/prompt.z.sh
source $DOTFU/include/input.z.sh

if [ -d $HOME/.rvm ]; then
    source $HOME/.rvm/scripts/rvm
    PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

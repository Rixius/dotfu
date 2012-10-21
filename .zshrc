# Path to .fu
export DOTFU=$home/src/.fu

# Path to your oh-my-zsh configuration.
export ZSH=$DOTFU/oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="rixius"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github ruby)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
source $DOTFU/include/path.sh
source $DOTFU/include/alias.sh
source $DOTFU/include/bundler.sh

export IRBC="$HOME/.irbc"

export ENVIRONMENT='development'

export SHELL="/bin/zsh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

fpath=($HOME/src/.fu/functions $fpath)
export fpath
autoload -U compinit
compinit

zstyle ':completion:*' menu select=2

# Allow for per-computer specilizations.
[ -f $HOME/.zshrc_overide ] && source ~/.zshrc_overide

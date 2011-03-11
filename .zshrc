# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

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
plugins=(git github textmate ruby)

# If using plugin github, enable these with the settings to makes use of the commands
export ZSH_PLUGIN_GITHUB_USERNAME="Rixius"
export ZSH_PLUGIN_GITHUB_TOKEN="56ee44ba1e5100af5f5d3a249f28b8d0"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

if [[ `pwd` = "$HOME" ]]; then
  cd $HOME/src
fi

export BAT_CHARGE=$HOME/.bin/bat

export PATH\
=$HOME/src/dot-fu/bin\
:$HOME/.bin\
:$HOME/src/wieck_scripts\
:$HOME/src/willGit/bin\
:$HOME/src/android-sdk-mac/tools\
:$HOME/src/android-sdk-mac/platform-tools\
:/Applications/Racket/bin\
:/usr/local/bin\
:/usr/local/sbin\
:/usr/bin:/bin\
:/usr/sbin\
:/sbin\
:/usr/X11/bin 




source ~/src/dot-fu/include/alias.sh
source ~/src/dot-fu/include/bundler.sh
source ~/src/dot-fu/include/NewsroomTools.sh

export nytsyn_dev_default_db="postgres://localhost/nytsyn_development"

tm() {
  tmux attach || tmux
}

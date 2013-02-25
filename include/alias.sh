##
#
# Some useful aliases.
#
##
alias a="alias"
alias bye="logout"
alias cp="cp -i"
alias cvf="tar cvf"
alias cvfz="tar cvfz"
alias cx="chmod +x"
alias del="rm -i"
alias e="vim"
alias fd="find . -type d -exec chmod 755 {} \; -o -type f -exec chmod 644 {} \;"
alias h='history | tail'
alias j="jobs -l"
alias l="ls -laF"
alias ll="ls -l"
alias lm="/bin/ls -alF|m"
alias lock="lockscreen"
alias lx="ls -axF"
alias m="less"
alias mj='ps $PSSWITCHES|grep $LOGNAME'
alias more="less"
alias mroe="less"
alias mv="mv -i"
alias p="ps $PSSWITCHES"
alias po="popd"
alias psg="p|fgrep $1"
alias pu="pushd"
alias rm="rm -i"
alias rrm="/bin/rm"
alias rxvt="rxvt -fn -misc-fixed-*-*-*-*-*-140-100-100-*-*-*-*&"
alias src="cd /usr/local/src"
alias tvf="tar tvf"
alias type="less"
alias u="unalias"
alias v="vim"
alias xt="xterm -fn -misc-fixed-*-*-*-*-*-140-100-100-*-*-*-*&"
alias xvf="tar xvf"
alias rm="rm -i"
alias m=less
alias more=less

##
#
# Some Environment Variables
#
##
# the name of the shell (bash of course ;-))
#SHELL=${SHELL:-${BASH:-/bin/bash}}
#export SHELL
##
# Pagers (less is more ;-))
PAGER='/usr/bin/env less'
# switches for less
LESS='-R -i -e -M -P%t?f%f :stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'
export PAGER LESS
# Editor Selection
EDITOR='/usr/bin/env vim'
VISUAL=$EDITOR
FCEDIT=$EDITOR
export EDITOR VISUAL FCEDIT
=======
alias zz='clear'
#alias mate='vim -'

alias ls='ls -a --color=tty'

alias google='lynx http://google.com'

alias rload="source $HOME/.zshrc"
alias :r='source $HOME/.zshrc'

alias  :q='exit'
alias :wq=':q'

function skey(){
    if [[ "$1" == "true" ]]; then
        eval `ssh-agent`
    else
        eval `ssh-agent -k`
    fi
}

alias clip='xclip -selection clipboard'

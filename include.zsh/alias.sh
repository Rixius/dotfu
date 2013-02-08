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


alias jj='java -jar'
alias zz='clear'
alias mate='vim -'

alias ls='ls -a --color=tty'

alias :r='source $HOME/.zshrc'

alias  :q='exit'
alias :wq=':q'

alias rload="source $HOME/.zshrc"

function rvmrc(){
  source $PWD/.rvmrc
}
function skey(){
    if [[ "$1" == "true" ]]; then
        eval `ssh-agent`
    else
        eval `ssh-agent -k`
    fi
}

alias clip='xclip -selection clipboard'

#which pcmanfm >/dev/null && alias fs='pcmanfm'

alias jj='java -jar'
alias zz='clear'
alias vv='vim .'

alias :r='source $HOME/.zshrc'

alias  :q='exit'
alias :wq=':q'

alias rload="source $HOME/.zshrc"
alias rvmrc="source $PWD/.rvmrc"

function skey(){
    if [[ "$1" == "true" ]]; then
        eval `ssh-agent`
    else
        eval `ssh-agent -k`
    fi
}

function mvim(){
    open $1 -a /Applications/MacVim.app/
}

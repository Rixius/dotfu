#!/usr/bin/env bash
function help() {
    echo "Usage: $(basename $0) [-favrtz]
-a  All
-v  Vim
-r  Ruby
-t  Tmux
-z  Zsh
-f  Force changes"
}
function vim(){
    appCheck git
    appCheck vim
    fCheck \
        $HOME/.vimrc \
        $HOME/.vim \
        $HOME/.vimbundles
    link $PWD/.vimrc $HOME/.vimrc
    link $PWD/.vim   $HOME/.vim
    $QUIET || echo "Installing plugins from git"
    $PWD/bin/vimbundles >/dev/null 2>&1
}
function ruby(){
    appCheck ruby
    fCheck $HOME/.irbrc $HOME/.irb.history
    link $PWD/.irbrc $HOME/.irbrc     
}
function tmux(){
    appCheck tmux
    fCheck $HOME/.tmux.conf
    link $PWD/.tmux.conf $HOME/.tmux.conf
}
function zsh(){ 
    gitCheck
    appCheck zsh
    fCheck $HOME/.zshrc $HOME/.oh-my-zsh
    link $PWD/.zshrc $HOME/.zshrc
    $QUIET || echo "Cloning Personal oh-my-zsh repo"
    git clone git@github.com:Rixius/oh-my-zsh.git $HOME/.oh-my-zsh >/dev/null 2>&1
}
function link(){
    $QUIET || echo "Linking $1 to $2"
    ln -s $1 $2
}
function fCheck(){
    while [ $# -ne 0 ]; do
        if [ -f $1 ] || [ -d $1 ]; then
            if $FORCE; then
                $QUIET || echo "Clearing out $1"
                rm -rf $1
            else
                echo "$1 still exists, please clean out or run with -f" >&2
                exit 1
            fi
        fi
        shift
    done
}
function gitCheck(){
    appCheck git
    if [ ! -f $HOME/.ssh/id_rsa ]; then
        "You don't have a key set up. Fix that and associate it Github" >&2
        exit 1
    elif ! ssh git@github.com -vv 2>&1 | grep 'Rixius' >/dev/null 2>&1; then
        echo "Your key must be authenticated to your Github account." >&2
        exit 1
    fi
}
function appCheck(){
    if ! which $1 >/dev/null 2>&1; then
        echo "You don't even have $1 installed, come back when you do." >&2
        exit 1
    fi
}

FORCE=false
QUIET=false
MULTI=false
while getopts "hfsarvtz" OPTION; do
    case $OPTION in
        h)
            help
            exit
            ;;
        f)
            FORCE=true
            ;;
        s)
            QUIET=true
            ;;
        a)
            vim
            ruby
            tmux
            zsh
            exit
            ;;
        r)
            MULTI=true
            ruby
            ;;
        v)
            MULTI=true
            vim
            ;;
        t)
            MULTI=true
            tmux
            ;;
        z)
            MULTI=true
            zsh
            ;;
    esac
done
$MULTI && exit
help
exit 1

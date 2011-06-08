#!/usr/bin/env bash
function help() {
    echo "Usage: $(basename $0) [-favtz]
-a  All
-v  Vim
-t  Tmux
-z  Zsh
-f  Force changes"
}
function vim(){
    appCheck git
    appCheck vim
    if 
    [ -f $HOME/.vimrc ] ||
    [ -d $HOME/.vim ]   ||
    [ -d $HOME/.vimbundles ]; then
        if $FORCE; then
            echo "Clearing out the vim files in $HOME"
            rm -rf $HOME/.vimrc $HOME/.vim $HOME/.vimbundles
        else
            echo "There are .vim files in your Home directory, please clean up or use -f"
            exit 1
        fi
    fi
    echo "Linking .vim and .vimrc"
    ln -s $PWD/.vimrc $HOME/.vimrc
    ln -s $PWD/.vim   $HOME/.vim
    echo "Installing plugins from git"
    $PWD/bin/vimbundles >/dev/null 2>&1
}
function tmux(){
    appCheck tmux
    if [ -f $HOME/.tmux.conf ]; then
        if $FORCE; then
            echo "Clearing $HOME/.tmux.conf"
            rm -f $HOME/.tmux.conf
        else
            echo "You still have a .tmux.conf, please clean up or use -f"
            exit 1
        fi
    fi
    echo "Linking .tmux.conf"
    ln -s $PWD/.tmux.conf $HOME/.tmux.conf
}
function zsh(){ 
    gitCheck
    appCheck zsh
    if [ -f $HOME/.zshrc ] || [ -d $HOME/.oh-my-zsh ]; then
        if $FORCE; then
            echo "Clearing zsh environment"
            rm -rf $HOME/.zshrc $HOME/.oh-my-zsh
        else
            echo "You still have a zsh environment, please clean up or use -f"
            exit 1
        fi
    fi
    echo "Linking .zshrc"
    ln -s $PWD/.zshrc $HOME/.zshrc
    echo "Cloning Personal oh-my-zsh repo"
    git clone git@github.com:Rixius/oh-my-zsh.git $HOME/.oh-my-zsh >/dev/null 2>&1
}
function gitCheck(){
    appCheck git
    if [ ! -f $HOME/.ssh/id_rsa ]; then
        "You don't have a key set up. Fix that and associate it Github"
        exit 1
    elif ! ssh git@github.com 2>&1 | grep 'Rixius' >/dev/null 2>&1; then
        echo "Your key must be authenticated to your Github account."
        exit 1
    fi
}
function appCheck(){
    if ! which $1 >/dev/null 2>&1; then
        echo "You don't even have $1 installed, come back when you do."
        exit 1
    fi
}

FORCE=false
while getopts "hfavtz" OPTION; do
    case $OPTION in
        h)
            help
            exit
            ;;
        f)
            FORCE=true
            ;;
        a)
            vim
            tmux
            zsh
            exit
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

#!/usr/bin/env bash

function link() {

	ln -s $PWD/$1 $HOME/$1

}

link .zshrc
link .vimrc
link .vim
link .tmux.conf

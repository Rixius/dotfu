#!/usr/bin/env bash

function link() {

	rm $HOME/$1
	ln -s $PWD/$1 $HOME/$1

}

link .gitconfig
link .zshrc
link .vimrc
link .vim
link .tmux.conf
link .bash_profile
link .bashrc

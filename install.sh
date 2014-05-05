#!/usr/bin/env bash

function link() {

	rm $HOME/$1
	ln -s $PWD/$1 $HOME/$1

}

link .gitconfig
link .subversion
link .zshrc
link .vimrc
link .vim
link .irbrc
link .irbrc_rails
link .tmux.conf
link .bash_profile
link .bashrc
link .ackrc

mkdir -p $HOME/.config
link .config/awesome

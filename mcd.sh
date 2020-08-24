#!/bin/zsh
#
# add a line to .zshrc
# . mcd.sh
# make sure script is in PATH
mcd () {
	mkdir -p "$1"
	cd "$1"
}


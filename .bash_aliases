#!/bin/bash

# funcs
gc() {
	git clone $1 $2
}

# aliases
alias sag='sudo apt-get'
alias sagu='sudo apt-get update'
alias saguf='sudo apt-get update --fix-missing'
alias sagi='sudo apt-get install'
alias sagid='sudo apt-get install --download-only'
alias sagup='sudo apt-get upgrade'
alias sagud='sudo apt-get dist-upgrade'
alias sagr='sudo apt-get remove'
alias sagp='sudo apt-get purge'
alias sagc='sudo apt-get clean'
alias sagar='sudo apt-get autoremove'
alias rm='trash'

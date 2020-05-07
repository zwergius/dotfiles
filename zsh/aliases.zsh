#!/bin/sh
alias reload="source ~/.zshrc"
alias ..="cd .."
alias g="git"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
# alias vim="stty stop '' -ixoff ; vim"
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f

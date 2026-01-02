#!/bin/sh
alias reload!="source ~/.zshrc"
alias g="git"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l"
alias bbic="brew update && brew bundle install --cleanup && brew upgrade"
# alias cat="bat"
# alias vim="stty stop '' -ixoff ; vim"
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f

smartresize() {
   mogrify -path $3 -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
}

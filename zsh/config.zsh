#!/bin/zsh
export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=true

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
autoload -U edit-command-line

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BEEP
setopt AUTO_CD
setopt CORRECT
# Automatically list choices on an ambiguous completion.
setopt AUTO_LIST
# Automatically use menu completion
setopt AUTO_MENU
# move cursor to end if word had one match
setopt ALWAYS_TO_END


# add timestamps to history
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
# not to store a history line if it's the same as the previous one
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_REDUCE_BLANKS
setopt HIST_ALLOW_CLOBBER
setopt SHARE_HISTORY
setopt NO_HIST_BEEP

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# fuzzy find: start to type
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search
bindkey "$terminfo[cuu1]" up-line-or-beginning-search
bindkey "$terminfo[cud1]" down-line-or-beginning-search

# backward and forward word with option+left/right
bindkey '^[^[[D' backward-word
bindkey '^[b' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[f' forward-word

# to to the beggining/end of line with fn+left/right or home/end
bindkey "${terminfo[khome]}" beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey '^[[F' end-of-line

# delete char with backspaces and delete
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

# delete word with ctrl+backspace
bindkey '^[[3;5~' backward-delete-word
bindkey '^[[3~' backward-delete-word

# edit command line in $EDITOR
bindkey '^e' edit-command-line

# search history with fzf if installed, default otherwise
if test -d /usr/local/opt/fzf/shell; then
  # shellcheck disable=SC1091
  . /usr/local/opt/fzf/shell/key-bindings.zsh
else
  bindkey '^R' history-incremental-search-backward
fi

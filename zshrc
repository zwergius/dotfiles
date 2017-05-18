export PATH=/usr/local/lib/ruby/gems/2.4.0/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
#export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
ZSHA_BASE=$HOME/Git/dotfiles

source $HOME/.aliases
source $HOME/.vim_pluginsrc
source $ZSHA_BASE/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle history-substring-search
antigen bundle terminalapp
antigen bundle osx
antigen bundle brew

# NVM
antigen bundle lukechilds/zsh-nvm

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme $ZSHA_BASE/themes doctor.zsh-theme

# Tell antigen that you're done.
antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

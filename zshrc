export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:./node_modules/.bin" # adding gulp eslint to the path

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

ZSHA_BASE=$HOME/.dotfiles

source $ZSHA_BASE/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle history-substring-search
antigen bundle terminalapp
antigen bundle osx

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme $ZSHA_BASE/themes doctor.zsh-theme

# Tell antigen that you're done.
antigen apply

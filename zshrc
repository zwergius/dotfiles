export PATH="/usr/local/sbin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH="$PATH:./node_modules/.bin" # run loaclly installed node modules 
export PATH=$HOME/Code/dotfiles/favicon-maker:$PATH
export PATH=$HOME/.local/bin:$PATH

# Globant AEM start
#Java export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export PATH=$JAVA_HOME/bin:$PATH
# Globant AEM end

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
#export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export DOTFILES=$HOME/Code/dotfiles
export VIMPLUG=$DOTFILES/vim/plug.vim
export HOMEBREW_BUNDLE_FILE=~/.brewfile
export N_PREFIX=$HOME/.n
export PATH="$N_PREFIX/bin:$PATH" # use n for node versions
export DOTNET_CLI_TELEMETRY_OPTOUT='false'
export XDG_CONFIG_HOME=$HOME/.config
export ASPNETCORE_ENVIRONMENT=Development

source $HOME/.vim_pluginsrc
source $DOTFILES/zsh/aliases.zsh
source $DOTFILES/zsh/starship.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
##### WHAT YOU WANT TO DISABLE FOR WARP - BELOW

  source $DOTFILES/zsh/config.zsh

  autoload -Uz compinit
  for dump in ~/.zcompdump(N.mh+24); do
    compinit
  done
  compinit -C

  # load every completion after autocomplete loads
  source $DOTFILES/zsh/completion.zsh

##### WHAT YOU WANT TO DISABLE FOR WARP - ABOVE
fi

# starship
export STARSHIP_CONFIG=$DOTFILES/starship.toml
eval "$(starship init zsh)"
# starship end

#Ruby
#export PATH="$HOME/.rbenv/bin:$PATH" # rbenv ruby version manager
#eval "$(rbenv init -)"
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# direnv
eval "$(direnv hook zsh)"

# pnpm
export PNPM_HOME="/Users/zwergius/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# alacritty tab title
preexec() { print -Pn "\e]0;$1%~\a" }

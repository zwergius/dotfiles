export PATH="/usr/local/sbin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH="$PATH:./node_modules/.bin" # run loaclly installed node modules 
export PATH=$HOME/Git/dotfiles/favicon-maker:$PATH
export PATH=$HOME/.local/bin:$PATH
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
#export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export DOTFILES=$HOME/Git/dotfiles
export VIMPLUG=$DOTFILES/vim/plug.vim
export HOMEBREW_BUNDLE_FILE=~/.brewfile
export N_PREFIX=$HOME/.n
export PATH="$N_PREFIX/bin:$PATH" # use n for node versions

source $HOME/.vim_pluginsrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

# all of our zsh files
typeset -U config_files
config_files=($DOTFILES/*/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}; do
  source "$file"
done

# load antibody plugins
source ~/.zsh_plugins.sh

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}; do
  source "$file"
done

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C


# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}; do
  source "$file"
done

unset config_files updated_at

eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/Users/zwergius/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
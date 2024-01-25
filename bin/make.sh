#!/bin/bash

# Initialize a variable that will hold the value related to the -f flag
overwrite_dotfiles=false

# Process the input arguments
while [ "$1" != "" ]; do
    case $1 in
        -f ) overwrite_dotfiles=true
             ;;
        * )  # You can process other arguments here
             ;;
    esac
    shift # Move on to the next input argument
done

red() {
  echo " $(tput setaf 1)$*$(tput setaf 9)"
}

yellow() {
  echo " $(tput setaf 3)$*$(tput setaf 9)"
}

green() {
  echo " $(tput setaf 2)$*$(tput setaf 9)"
}

move_to_backup_dir() {
  local file_path="$1"
  local current_path="$HOME/$file_path"
  local backup_path="$HOME/.dotfiles-backup/$file_path"
  local backup_dir="$(dirname "$backup_path")"

  if [ ! -d "$backup_dir" ]; then
    if ! mkdir -p "$backup_dir"; then
      return 1
    fi
  fi

  if [ -e "$backup_path" ]; then
    rm -rf "$backup_path"
  fi

  mv "$current_path" "$backup_path"
  return $?
}

link_dotfile() {
  local source="$1"
  local dest="$2"
  local full_dest="$HOME/$dest"

  if [ "$overwrite_dotfiles" = "false" ] && [ -L "$full_dest" ] && [ "$full_dest" -ef "$source" ]; then
    yellow "✔ $dest is already linked"
    return
  fi

  if [ -e "$full_dest" ]; then
    if [ "$overwrite_dotfiles" = "true" ]; then
      yellow "ℹ $dest already exists, moving to backup directory"
      if ! move_to_backup_dir "$dest"; then
        red "✘ couldn't create backup for $dest"
        return
      fi
    else
      red "✘ $dest already exists"
      return
    fi
  fi

  local link_dir="$(dirname "$full_dest")"
  if [ ! -d "$link_dir" ]; then
    if ! mkdir -p "$link_dir"; then
      red "✘ couldn't create directory $link_dir"
      return
    fi
  fi

  if ln -s "$(pwd)/$source" "$full_dest"; then
    green "✔ $dest has been linked"
  else
    red "✘ $dest link couldn't be created"
  fi
}

link_dotfile "zshrc" ".zshrc"
link_dotfile "vimrc" ".vimrc"
link_dotfile "Brewfile" ".Brewfile"
link_dotfile "gitconfig" ".gitconfig"
link_dotfile "gitignore" ".gitignore"
link_dotfile "config/alacritty" ".config/alacritty"
link_dotfile "../kickstart.nvim" ".config/nvim"

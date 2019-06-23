#! /usr/bin/env bash

export DOTFILES_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

install_brew() {
  info "installing brew packages"
  cd "$DOTFILES_ROOT"
  brew bundle
}

link_file() {
  local src=$1 dst=$2
  local currentSrc="$(readlink $dst)"
  if [ "$currentSrc" == "$src" ]
  then
    success "skipped $src"
  else
    ln -s $src $dst
    success "linked $src to $dst"
  fi
}

install_symlinks() {
  info "installing dotfiles"
  for src in $(find -H "$DOTFILES_ROOT" -name '*.symlink')
  do
    dst="$HOME/$(basename "${src%.*}")"
    link_file  "$src" "$dst"
  done
}

install_zsh() {
  DEFAULT_SHELL=$(basename $(dscl . -read /Users/$(whoami) UserShell | cut -f2 -d" "))
  if [ "$DEFAULT_SHELL" == "zsh" ]
  then
    success "default shell already set to ZSH"
  else
    success "changing default shell to kick-ass ZSH"
    chsh -s $(which zsh)
  fi
}

install_python_stuff() {
  # Ensure the venv directory
  echo "start python"
  export WORKON_HOME=$HOME/.virtualenvs
  ./python/pythondeps.sh
  ./python/pipsi.sh
  cp $DOTFILES_ROOT/python/postactivate \
    $DOTFILES_ROOT/python/postdeactivate $WORKON_HOME
}

install_brew
install_symlinks
install_zsh
install_python_stuff
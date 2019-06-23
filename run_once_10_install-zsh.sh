#!/usr/bin/env bash

set -e

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

DEFAULT_SHELL=$(basename $(dscl . -read /Users/$(whoami) UserShell | cut -f2 -d" "))
if [ "$DEFAULT_SHELL" == "zsh" ]
then
  success "default shell already set to ZSH"
else
  success "changing default shell to kick-ass ZSH"
  chsh -s $(which zsh)
fi
# install_python_stuff
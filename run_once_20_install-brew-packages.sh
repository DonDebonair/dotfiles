#!/usr/bin/env bash

echo "Installing Homebrew packages and casks..."

cat <<EOF | brew bundle --file=/dev/stdin
cask_args appdir: '/Applications'

tap 'homebrew/cask-versions'

# Utils
brew 'zsh'
brew 'openssl'
brew 'nmap'
brew 'wget'
brew 'coreutils'
brew 'findutils'
brew 'readline'
brew 'autojump'
brew 'jq'
brew 'ngrep'
brew 'ack'
brew 'gnu-sed'
brew 'fzf'
brew 'fpp'
brew 'hub'
brew 'ffmpeg'
brew 'peco'
brew 'the_silver_searcher'
brew 'ripgrep'
brew 'twpayne/taps/chezmoi'

# Dev
cask 'java8' unless system '/usr/libexec/java_home --failfast'
brew 'git'
brew 'git-extras'
brew 'mercurial'
brew 'node'
brew 'leiningen'
brew 'ant'
brew 'maven'
brew 'sbt'
brew 'python'
# for mercurial and fpp
brew 'python@2'
brew 'pyenv'
brew 'pyenv-virtualenvwrapper'
brew 'redis'
brew 'go', args: ['cross-compile-common']
brew 'direnv'

# GUI
cask '1password'
cask 'alfred'
cask 'bitbar'
cask 'docker'
cask 'dropbox'
cask 'dropshare'
cask 'evernote'
cask 'notion'
cask 'google-chrome'
cask 'iina-beta'
cask 'iterm2-beta'
cask 'jetbrains-toolbox'
cask 'karabiner-elements'
cask 'slack'
cask 'spectacle'
cask 'spotify'
cask 'sublime-text'
cask 'telegram-desktop'
cask 'transmission'
cask 'typora'
# cask 'virtualbox'
cask 'vlc'
EOF

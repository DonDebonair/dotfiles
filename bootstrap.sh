#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")"
git pull
function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "install-deps.sh" --exclude "README.md" --exclude ".gitconfig_credentials" --exclude ".gitignore" -av . ~
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt

# Add git author info and github credentials to gitconfig
if [ -f .gitconfig_credentials ]; then
    cat .gitconfig_credentials >> ~/.gitconfig
fi

source ~/.bash_profile
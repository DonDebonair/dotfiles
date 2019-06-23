# up to you (me) if you want to run this as a file or copy paste at your leisure

# Ask for the administrator password upfront
sudo -v

# homebrew!
# you need the code CLI tools YOU FOOL.
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Homebrew was already installed. Updating..."
    brew update
fi

# Add Homebrew ZSH to login shell options
HOMEBREW_ZSH_PATH="$(brew --prefix)/bin/zsh"
if ! grep -Fxq "$HOMEBREW_ZSH_PATH" /etc/shells; then
	echo "Adding Homebrew zsh ($HOMEBREW_ZSH_PATH) to login shell options (/etc/shells)..."
	sudo sh -c 'echo "$(brew --prefix)/bin/zsh" >> /etc/shells'
else
	echo "Homebrew zsh already in login shell options (/etc/shells)..."
fi

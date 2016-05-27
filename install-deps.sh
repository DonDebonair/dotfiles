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

# This won't work if your Homebrew prefix is different
echo "Adding Homebrew zsh to login shell options (/etc/shells)..."
sudo sh -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
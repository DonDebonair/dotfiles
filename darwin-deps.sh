# homebrew!
# you need the code CLI tools YOU FOOL.
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval $(/opt/homebrew/bin/brew shellenv)
else
    echo "Homebrew was already installed. Updating..."
    brew update
fi

# Remove chezmoi so we can use the homebrew version
if [[ -f "$HOME/bin/chezmoi" ]]; then
    echo "Replace $HOME/bin/chezmoi with Homebrew version"
    rm "$HOME/bin/chezmoi"
fi

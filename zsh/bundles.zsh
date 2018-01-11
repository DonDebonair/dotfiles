if ! zgen saved; then
# Load base oh-my-zsh & plugins & theme
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/git-extras
    zgen oh-my-zsh plugins/autojump
    zgen oh-my-zsh plugins/httpie
    zgen oh-my-zsh plugins/lein
    zgen oh-my-zsh plugins/mvn
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/pyenv
    zgen oh-my-zsh themes/lambda

    # Load other plugins
    zgen load djui/alias-tips
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search

    # Save it
    zgen save
fi

# history search with UP/DOWN arrows
zmodload zsh/terminfo
bindkey "$terminfo[cuu1]" history-substring-search-up
bindkey "$terminfo[cud1]" history-substring-search-down
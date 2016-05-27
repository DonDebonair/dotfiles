antigen use oh-my-zsh

antigen bundle git
antigen bundle git-extras
antigen-bundle Tarrasch/zsh-autoenv
antigen bundle virtualenv
antigen bundle virtualenvwrapper
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle djui/alias-tips
antigen bundle autojump
antigen bundle brew
antigen bundle httpie
antigen bundle lein
antigen bundle mvn
antigen bundle pip
antigen bundle sudo

antigen apply

antigen theme lambda

# history search with UP/DOWN arrows
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
zmodload zsh/terminfo
bindkey "$terminfo[cuu1]" history-substring-search-up
bindkey "$terminfo[cud1]" history-substring-search-down
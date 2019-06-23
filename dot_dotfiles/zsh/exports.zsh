# Give Maven plenty of memory
export MAVEN_OPTS='-Xms512m -Xmx1024m'

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$fg[yellow]"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

export WORKON_HOME=$HOME/.virtualenvs

# Prefer US English and use UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

export EDITOR="code"
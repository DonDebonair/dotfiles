#!/usr/bin/env bash

echo "Setting up virtualenvwrapper and prompt..."

# Set the path, because this might be the first time the script is run, before zsh is configured
# We want to use the Homebrew Python we just installed
export PATH="$HOME/bin:$HOME/.local/bin:$(brew --prefix)/opt/python/libexec/bin:/usr/local/bin:/usr/local/sbin:$PATH"

export WORKON_HOME=$HOME/.virtualenvs

export PIP_REQUIRE_VIRTUALENV=false
which -s pyenv
if [[ $? == 0 ]] ; then
    PY_VERSION=$(pyenv version-name)
    pyenv global system
    pip install --upgrade pip
    pip install --upgrade setuptools
    pip install virtualenv
    pip install virtualenvwrapper
    pyenv global $PY_VERSION
else
    pip install --upgrade pip
    pip install --upgrade setuptools
    pip install virtualenv
    pip install virtualenvwrapper
fi

mkdir -p $WORKON_HOME
export PIP_REQUIRE_VIRTUALENV=true

cat << ACTEOF > "$WORKON_HOME/postactivate"
#!/bin/bash
# This hook is run after virtualenv is activated.
# argument: environment name

PY_V=$(python -c 'import platform;v=platform.python_version_tuple();print("%s.%s.%s" % (v))')

_OLD_RPROMPT="$RPROMPT"
RPROMPT="%{${fg_bold[white]}%}(env: %{${fg[green]}%}`basename \"$VIRTUAL_ENV\"`@$PY_V%{${fg_bold[white]}%})%{${reset_color}%} $RPROMPT"
ACTEOF

cat << DEACTEOF > "$WORKON_HOME/postdeactivate"
#!/bin/bash
# This hook is run after virtualenv is activated.
# argument: environment name

RPROMPT="$_OLD_RPROMPT"
DEACTEOF


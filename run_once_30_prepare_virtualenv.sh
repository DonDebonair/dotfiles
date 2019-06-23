#!/usr/bin/env bash

pip install --upgrade pip
pip install --upgrade setuptools
pip install virtualenv
pip install virtualenvwrapper
mkdir -p $WORKON_HOME

cat << ACTEOF > $WORKON_HOME/postactivate
#!/bin/bash
# This hook is run after virtualenv is activated.
# argument: environment name

PY_V=$(python -c 'import platform;v=platform.python_version_tuple();print("%s.%s.%s" % (v))')

_OLD_RPROMPT="$RPROMPT"
RPROMPT="%{${fg_bold[white]}%}(env: %{${fg[green]}%}`basename \"$VIRTUAL_ENV\"`@$PY_V%{${fg_bold[white]}%})%{${reset_color}%} $RPROMPT"
ACTEOF

cat << DEACTEOF > $WORKON_HOME/postdeactivate
#!/bin/bash
# This hook is run after virtualenv is activated.
# argument: environment name

RPROMPT="$_OLD_RPROMPT"
DEACTEOF


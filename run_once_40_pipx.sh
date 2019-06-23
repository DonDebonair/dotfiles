#!/usr/bin/env bash

echo "Installing pipx..."

export PIP_REQUIRE_VIRTUALENV=false
which -s pyenv
if [[ $? == 0 ]] ; then
    PY_VERSION=$(pyenv version-name)
    pyenv global system
    pip install pipx
    pyenv global "$PY_VERSION"
else
    pip install pipx
fi
export PIP_REQUIRE_VIRTUALENV=true

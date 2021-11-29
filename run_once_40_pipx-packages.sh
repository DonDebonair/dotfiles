#!/usr/bin/env bash

echo "Installing pipx packages..."

function pipx-install {
    package=$1
    output="$(pipx install $package ${@:2})"

    if [[ $? -eq 0 ]] ; then
        echo "$output"
    else
        echo "Package '$package' was already installed"
    fi
}

pipx-install httpie
pipx-install percol
pipx-install Pygments
pipx-install pre-commit
pipx-install poetry
pipx-install ansible-core
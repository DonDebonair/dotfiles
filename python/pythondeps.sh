#! /usr/bin/env bash

pip install --upgrade pip
pip install --upgrade setuptools
pip install virtualenv
pip install virtualenvwrapper
mkdir -p $WORKON_HOME

# for the c alias (syntax highlighted cat)
pip install Pygments
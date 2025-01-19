#!/usr/bin/env bash

echo "Installing packages with uv tool..."

uv tool install httpie
uv tool install percol
uv tool install Pygments
uv tool install pre-commit
uv tool install poetry
uv tool install ansible-core

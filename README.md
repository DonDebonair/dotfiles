# My dotfiles

These are my dotfiles for an awesome ZSH-based environment that supports customized installations on multiple machines! 
I now use [chezmoi](https://github.com/twpayne/chezmoi) for managing my dotfiles, so I can have dynamic dotfiles based 
on the environment/machine I'm working on. The old manually managed dotfiles are still there in the 
[`old-single-machine-setup`](https://github.com/DandyDev/dotfiles/tree/old-single-machine-setup) branch.

## Installation

### Get the goods

You can bootstrap these dotfiles on a fresh machine as follows:

```bash
curl -sfL https://git.io/chezmoi | sh
chezmoi init https://github.com/DandyDev/dotfiles
# or if you're me and you have write access to this repo:
chezmoi init git@github.com:DandyDev/dotfiles.git
chezmoi apply
```

To update:

```zsh
chezmoi update
```

## Usage

When you make changes to the dotfiles, you'll have to apply them

```zsh
dot!
```

(`dot!` is short for `chezmoi apply`)

You can reload the shell only by doing:

```zsh
reload!
```

## Feedback

Suggestions/improvements
[welcome](https://github.com/DandyDev/dotfiles/issues)!

# My dotfiles

These are my dotfiles for an awesome ZSH-based environment! I used to be Bash-using plebs, but I've seen the light and now I'm 
using ZSH. The old dotfiles are still there in the [`old-bash`](https://github.com/DandyDev/dotfiles/tree/old-bash) branch.

These dotfiles are inspired by, and to some extend shamelessly copied from my friend 
[Marcel's amazing dotfiles](https://github.com/mkrcah/dotfiles). I took the good parts of my old Bash dotfiles and added them 
to the mix.

## Installation

### Get the goods

You can clone the repository wherever you want (I like to keep it in `~/projects/tools/dotfiles`) and run the `install.sh` script 
to get started.

```bash
git clone https://github.com/DandyDev/dotfiles.git && cd dotfiles && ./install.sh
```

To update, pull the changes and use the `dot!` command to update

```zsh
cd $DOTFILES && git pull && dot!
```

### Installing dependencies

Some of these dotfiles depend on certain CLI utilities to be installed (Homebrew etc.) Install those dependencies:

```zsh
./install-deps.sh
```

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```zsh
./.osx
```

## Usage

When you make changes to anything in the `zsh` dir, reloading the configuration is enough:

```zsh
reload!
```

When you add Python packages (in the `python` dir) or Homebrew packages (in the `Brewfile`), you need to reinstall again:

```zsh
dot! && reload!
```


## Feedback

Suggestions/improvements
[welcome](https://github.com/DandyDev/dotfiles/issues)!

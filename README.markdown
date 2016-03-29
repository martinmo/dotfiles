# dotfiles

These are my config files I use on several Linux and Mac boxes, shared here for
your and my convenience.

Be warned: these dotfiles are very biased towards Vim, zsh and OS X.

## Usage

All configs are organized in groups, which can be selectively symlinked into `$HOME`
with [GNU Stow](https://www.gnu.org/software/stow/stow.html).

It is recommended to clone this repo into a subdirectory of `$HOME`:

    git clone https://github.com/martinmo/dotfiles.git ~/dotfiles

To symlink (speak: activate) a group (e.g., `vim`):

    cd ~/dotfiles
    stow vim

To deactivate this group, use the `-D` flag:

    stow -D vim

To activate all groups use this handy `zsh` shortcut:

    stow *(/)

To get an overview of the symlinks that get created, use:

    find ~ -maxdepth 1 -type l -ls


## Sensitive files

Though I am happy to share my dotfiles with you, some config files contain
sensitive information (i.e., `.ssh/config`). I have encrypted these files with
[git-crypt](https://github.com/AGWA/git-crypt).


## Vim plugins

If you want to use the Vim plugins, you need to initialize the git submodules first.

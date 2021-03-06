# dotfiles

These are my config files I use on several Linux and Mac boxes, shared here for
your and my convenience.


## Usage

All configs are organized in groups, which can be selectively symlinked into `$HOME`
with [GNU Stow](https://www.gnu.org/software/stow/stow.html).

It is recommended to clone this repo into a subdirectory of `$HOME`:

    git clone https://github.com/martinmo/dotfiles.git ~/.dotfiles

To symlink (speak: activate) a group (e.g., `vim`):

    cd ~/.dotfiles
    stow vim

To deactivate this group, use the `-D` flag:

    stow -D vim

To activate all groups use this handy `zsh` shortcut:

    stow *(/)

To get an overview of the symlinks that get created, use:

    find ~ -maxdepth 1 -type l -ls


## Vim plugins

The Vim plugins are managed with [Vundle](https://github.com/VundleVim/Vundle.vim),
which is included as a submodule. To initialize, run:

    git submodule update --init

Then launch `vim` and run `:PluginInstall` once. After that, you should run
`:PluginUpdate` from time to time.

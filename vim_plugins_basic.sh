#!/bin/bash
##
## Initialize a basic set of Vim plugins
##
set -e

bundles=vim/.vim/bundle
plugins="ack.vim nerdcommenter vim-airline vim-fugitive vim-gitgutter"
plugins="$plugins vim-polyglot vim-repeat vim-sensible vim-surround"

for plugin in $plugins; do
    git submodule init $bundles/$plugin
done

git submodule update

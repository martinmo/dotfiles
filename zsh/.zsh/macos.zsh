# Use ls colors similar to the ones used by GNU ls and tree
export CLICOLOR=1
export LSCOLORS=ExGxcxdxCxDxDxabagacad

# Display ComputerName instead of DHCP-provided name in the prompt
HOST="${$(scutil --get ComputerName)// /-}"

# Use Preview.app to read manpages ...
man-preview() {
    man -t "$@" | open -a Preview -f
}

# ... and reuse man completion
compdef _man man-preview

# Eject external FileVault 2 disks correctly:
#   - eject the virtual *and* surrounding physical disk
#   - ask to force unmount the virtual disk if necessary
eject32() {
    local virtdisk=/dev/disk3
    local physdisk=/dev/disk2
    diskutil eject $virtdisk && diskutil eject $physdisk
    if [[ $? != 0 ]]; then
        # see zshbuiltins(1) for the funny read syntax
        if read -q "?Force unmount $virtdisk? [y/n] "; then
            echo
            diskutil unmount force $virtdisk && diskutil eject $physdisk
        fi
    fi
}

# pyenv setup
if [[ -d ~/.pyenv ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    path=($PYENV_ROOT/bin $path)
    eval "$(pyenv init -)"
fi

# JVM-related stuff: adding JAVA_HOME/bin to PATH is not strictly
# necessary on OS X, but will help finding the right man pages.
if [[ -d /Library/Java/Home ]]; then
    export JAVA_HOME=/Library/Java/Home
    path=($JAVA_HOME/bin $path)
fi

# Open files from the command line
alias o='open'

# Show/hide hidden files in the Finder
alias showfiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'

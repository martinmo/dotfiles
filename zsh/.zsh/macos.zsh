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
    path=(~/.pyenv/bin $path)
    eval "$(pyenv init --path)"
fi

# Open files from the command line
alias o='open'

# Check if we are connected to the internet
alias up='ping -no 8.8.8.8'

# Open FF
alias ff='open -a Firefox'

# Quickly open reference docs
ngxdoc() {
    open "https://nginx.org/r/${1:-server}"
}
pyref() {
    open "https://docs.python.org/3/library/${1:-index}.html"
}

# I prefer to use GNU sed instead of BSD sed
alias sed=gsed

# Also, `bat` can be used as a drop-in for `cat`
alias cat='bat --plain'

# Always colorize ripgrep output (e.g., when piping to less)
# and search hidden files.
alias rg='rg --pretty --hidden'

# Show/hide hidden files in the Finder
alias showfiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'

# Convenient JAVA_HOME configuration (example: `jdk 11`)
jdk() {
    local java_home
    java_home="$(/usr/libexec/java_home -v $1)"
    (( $? == 0 )) && export JAVA_HOME="$java_home"
}

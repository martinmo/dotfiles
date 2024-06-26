# Use ls colors similar to the ones used by GNU ls and tree
export CLICOLOR=1
export LSCOLORS=ExGxcxdxCxDxDxabagacad

# Always use an english locale
export LANG=en_US.UTF-8

# Display ComputerName instead of DHCP-provided name in the prompt
HOST="${$(scutil --get ComputerName)// /-}"

# Use Preview.app to read manpages ...
man-preview() {
    command man -t "$@" | open -a Preview -f
}

# ... and reuse man completion
compdef _man man-preview

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

# macOS variants of clipcopy/clippaste
alias clipcopy='pbcopy'
alias clippaste='pbpaste'

# macOS variant of sudoedit
alias sudoedit='sudo -e'

# Quickly open reference docs
ngxdoc() {
    open "https://nginx.org/r/${1:-server}"
}
pyref() {
    open "https://docs.python.org/3/library/${1:-index}.html"
}

# I prefer to use GNU sed instead of BSD sed
if (( $+commands[gsed] )); then
    alias sed=gsed
fi

# Show/hide hidden files in the Finder
alias showfiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'

# Convenient JAVA_HOME configuration (example: `jdk 11`)
jdk() {
    local java_home
    java_home="$(/usr/libexec/java_home -v $1)"
    (( $? == 0 )) && export JAVA_HOME="$java_home"
    MANPATH=$JAVA_HOME/man:$MANPATH
}

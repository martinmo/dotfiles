# Cache completion results
zstyle ':completion:*' use-cache on

# Enable completion menu
zstyle ':completion:*' menu select

# Fuzzy completion
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Ignore completion functions for commands I don't have
zstyle ':completion:*:functions' ignored-patterns '_*'

# Remove trailing slashes
zstyle ':completion:*' squeeze-slashes true

# Ignore pwd when completing ../
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Provide .. as a completion
zstyle ':completion:*' special-dirs ..

# Use the same colors as `ls`
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Pick up new commands in $PATH immediately (i.e., automatically rehash)
zstyle ':completion:*' rehash true

# Only offer the following user names as completion
zstyle ':completion:*' users $USER root

# More completion definitions
if [[ -n "$HOMEBREW_PREFIX" ]]; then
    fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $HOMEBREW_PREFIX/share/zsh-completions $fpath)
fi

fpath=(~/.zsh/completions $fpath)

# Initialize
autoload -Uz compinit && compinit

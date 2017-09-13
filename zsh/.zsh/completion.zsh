# Cache completion results
zstyle ':completion:*' use-cache on

# Enable completion menu
zstyle ':completion:*' menu select

# Fuzzy completion
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

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

# More completion definitions
fpath=(/usr/local/share/zsh-completions $fpath)

# Initialize
autoload -Uz compinit && compinit

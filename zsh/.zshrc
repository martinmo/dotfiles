# ZSH options

# Convenience options
setopt autocd
setopt completeinword
setopt correct
setopt hashlistall
setopt interactivecomments
setopt longlistjobs
setopt checkjobs
setopt nobeep
setopt nohup
setopt notify

# History settings
setopt extendedhistory
setopt sharehistory
setopt histignorealldups
setopt histignorespace
setopt histnostore
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Globbing
setopt extendedglob
setopt nonullglob

# Enable multibyte support unconditionally
setopt combiningchars

# Disable email checks
MAILCHECK=0

# Never report wall time for commands
REPORTTIME=-1

# More granular removal of words
WORDCHARS=

# Automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath PATH CDPATH FPATH MANPATH

# View the manpage for the currently typed command with Esc-h
autoload -Uz run-help run-help-git run-help-openssl run-help-sudo

# Load "outsourced" configuration files
source ~/.zsh/colors.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/keybindings.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/termsupport.zsh
source ~/.zsh/dirstack.zsh
source ~/.zsh/utils.zsh
source ~/.zsh/fuzzyfinder.zsh

# Add binaries from pipx, go and cargo to PATH if available
_add_to_path_if_exists() {
    [[ -d $1 ]] && path=($1 $path)
}
_add_to_path_if_exists ~/go/bin
_add_to_path_if_exists ~/.cargo/bin
_add_to_path_if_exists ~/.local/bin

# Default environment
export EDITOR=${EDITOR:-vim}

# Enable colored output for tree and grep
if (( $+commands[tree] )); then
    alias tree='tree -C'
fi
alias grep='grep --color=auto'

# Default aliases
alias l='ls'
alias l.='ls -d .*'
alias ll='ls -l'
alias la='ls -A'

# Get my IPv4/IPv6 address as seen by webservers
alias ip4='curl -4 icanhazip.com'
alias ip6='curl -6 icanhazip.com'

# Change to the root directory of a git clone
alias gg='cd "$(git rev-parse --show-toplevel)"'

# Quick commit log summary
alias gl='git ol -15'

# Git force push with safety net
alias gfp='git push --force-with-lease'

# zmv file renaming utility (e.g., `zmv *.bar foo/*.baz`)
autoload -Uz zmv
alias zmv='noglob zmv -W'

# Load OS specific configurations
[[ $OSTYPE == darwin* ]] && source ~/.zsh/macos.zsh
[[ $OSTYPE == linux* ]]  && source ~/.zsh/linux.zsh

# Load local configuration
[[ -r ~/.zshrc.local ]] && source ~/.zshrc.local

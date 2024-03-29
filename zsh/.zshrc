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
HISTSIZE=5000
SAVEHIST=5000

# Ignore venv source issued by VS Code
HISTORY_IGNORE='source /*/.venv/bin/activate'

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
unalias run-help &>/dev/null

# Load "outsourced" configuration files
source ~/.zsh/colors.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/keybindings.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/termsupport.zsh
source ~/.zsh/dirstack.zsh
source ~/.zsh/utils.zsh

# fzf fuzzy finder (only in interactive sessions)
[[ $- == *i* ]] && source ~/.zsh/fuzzyfinder.zsh

# Add binaries from pipx, go and cargo to PATH if available
_add_to_path_if_exists() {
    [[ -d $1 ]] && path=($1 $path)
}
_add_to_path_if_exists ~/go/bin
_add_to_path_if_exists ~/.cargo/bin
_add_to_path_if_exists ~/.local/bin

# If not running as root set $SUDO to sudo
(( EUID != 0 )) && SUDO='sudo' || SUDO=''

# Default environment
export EDITOR=${EDITOR:-vim}
export LESS='-X -S -F -R -x4 -i'
export MANWIDTH=80

# Enable colored output for tree and grep
alias tree='tree -C'
alias grep='grep --color=auto'

# Default aliases
alias l='ls'
alias l.='ls -d .*'
alias ll='ls -l'
alias la='ls -A'
alias -g L='|less'

# Show hidden and ignored files when searching with fd
alias fd='fd --hidden --no-ignore'

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

# Python's JSON pretty printer tool
alias json-fmt='python3 -m json.tool'

# Create a SOCKS5 proxy on localhost:9999 with an arbitrary remote host
alias ssh-socks-proxy='ssh -n -N -D 127.0.0.1:9999'

# Load OS specific configurations
[[ $OSTYPE == darwin* ]] && source ~/.zsh/macos.zsh
[[ $OSTYPE == linux* ]]  && source ~/.zsh/linux.zsh

# Load local configuration
[[ -r ~/.zshrc.local ]] && source ~/.zshrc.local

# ZSH options

# Convenience options
setopt autocd
setopt completeinword
setopt correct
setopt hashlistall
setopt interactivecomments
setopt longlistjobs
setopt nobeep
setopt nohup
setopt notify

# History settings
setopt sharehistory
setopt histignorealldups
setopt histignorespace
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

# Globbing
setopt extendedglob
setopt nomatch

# Enable multibyte support unconditionally
setopt combiningchars

# Disable email checks
MAILCHECK=0

# Never report wall time for commands
REPORTTIME=-1

# More granular removal of words
WORDCHARS=

# Automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath

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

# Add binaries in $HOME to the path
for dir in ~/bin ~/.local/bin; do
    [[ -d $dir ]] && path=($dir $path)
done

# If not running as root set $SUDO to sudo
(( EUID != 0 )) && SUDO='sudo' || SUDO=''

# Default environment
export EDITOR='vim'
export LANG='en_US.UTF-8'
export LESS='-X -S -F -R -x4 -i'
export MANWIDTH=80

# Enable colored output for tree and grep
alias tree='tree -C'
alias grep='grep --color=auto'

# Default aliases
alias l.='ls -d .*'
alias ll='ls -l'
alias la='ls -a'
alias -g L='|less'

# Shortcuts to temporarily disable SSH over a proxy
alias directssh='ssh -o ProxyCommand=none'
alias directscp='scp -o ProxyCommand=none'

# Change to the root directory of a git clone
alias Groot='cd "$(git rev-parse --show-toplevel)"'

# Load OS specific configurations
[[ $OSTYPE == darwin* ]] && source ~/.zsh/macos.zsh
[[ $OSTYPE == linux* ]]  && source ~/.zsh/linux.zsh

# Load local configuration
[[ -r ~/.zshrc.local ]] && source ~/.zshrc.local

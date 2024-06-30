# Use consistent colors for BSD and GNU ls, tree and zsh completion
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32'

# Colored manpages without cluttering the environment
function man {
    local -a environment
    environment=(
        MANWIDTH=80
        PAGER=less
        LESS_TERMCAP_mb=$'\E[01;34m'
        LESS_TERMCAP_md=$'\E[01;34m'
        LESS_TERMCAP_me=$'\E[0m'
        LESS_TERMCAP_se=$'\E[0m'
        LESS_TERMCAP_so=$'\E[01;44;33m'
        LESS_TERMCAP_ue=$'\E[0m'
        LESS_TERMCAP_us=$'\E[01;33m'
    )
    command env $environment man "$@"
}

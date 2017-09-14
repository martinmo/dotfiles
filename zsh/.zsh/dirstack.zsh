# Directory stack
setopt autopushd
setopt pushdignoredups
setopt pushdminus
setopt pushdsilent
DIRSTACKSIZE=20
DIRSTACKFILE=~/.zdirs

# Persist the directory stack after changing dirs
typeset -gaU MY_DIRSTACK
chpwd() {
    [[ $PWD == ~ ]] && return
    MY_DIRSTACK=( $PWD "${(@)MY_DIRSTACK[1,$DIRSTACKSIZE]}" )
    print -l ${MY_DIRSTACK} > ${DIRSTACKFILE}
}

# Load the directory stack on startup (copied from grml-zsh)
if [[ -f ${DIRSTACKFILE} ]]; then
    # Enabling NULL_GLOB via (N) weeds out any non-existing
    # directories from the saved dir-stack file.
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"}(N) )
fi

MY_DIRSTACK=( "${dirstack[@]}" )

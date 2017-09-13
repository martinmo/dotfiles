# Use emacs keybindings
bindkey -e

# Convert ... to ../.. and so on during typing
rationalise-dot() {
    if [[ $LBUFFER = *.. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}
zle -N rationalise-dot
bindkey '.' rationalise-dot

# Edit command line in editor with Ctrl-X Ctrl-E
autoload -Uz edit-command-line && zle -N edit-command-line
bindkey '^X^E' edit-command-line

# Use vi keys in menu selection
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Expand history with the space key
bindkey ' ' magic-space

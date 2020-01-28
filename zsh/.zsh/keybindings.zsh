# Use emacs keybindings
bindkey -e

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid (from oh-my-zsh)
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# Convert ... to ../.. and so on during typing (from grml)
rationalise-dot() {
  local MATCH
  if [[ $LBUFFER =~ '(^|/| |      |'$'\n''|\||;|&)\.\.$' ]]; then
    LBUFFER+=/
    zle self-insert
    zle self-insert
  else
    zle self-insert
  fi
}
zle -N rationalise-dot
bindkey '.' rationalise-dot

# without this, typing a . aborts incremental history search (from grml)
bindkey -M isearch '.' self-insert

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

# Fuzzy history search with Up/Down arrows
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# Use Ctrl-Z as a shortcut for typing `fg` (from grml-zsh)
function grml-zsh-fg() {
  if (( ${#jobstates} )); then
    zle .push-input
    [[ -o hist_ignore_space ]] && BUFFER=' ' || BUFFER=''
    BUFFER="${BUFFER}fg"
    zle .accept-line
  else
    zle -M 'No background jobs. Doing nothing.'
  fi
}
zle -N grml-zsh-fg
bindkey '^Z' grml-zsh-fg

# Use Option+Arrows to move between words
bindkey '[C' forward-word
bindkey '[D' backward-word

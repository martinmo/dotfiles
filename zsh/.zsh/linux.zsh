# Color output whenever possible
alias ls='ls --color=auto'
alias ip='ip --color=auto'

# Because systemctl is a nightmare to type *and* complete
if (( $+commands[systemctl] )); then
    alias sc="sudo systemctl"
    alias jc="sudo journalctl"
fi

# Wayland variant of clipcopy/clippaste
if (( $+commands[wl-copy])); then
    alias clipcopy='wl-copy'
    alias clippaste='wl-paste --no-newline'
fi

# Aliases to allow me to reuse muscle memory from macOS usage
alias o=xdg-open

if (( $+commands[batcat] )); then
    alias bat=batcat
fi

if (( $+commands[fdfind] )); then
    alias fd=fdfind
fi

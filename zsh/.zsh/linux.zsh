# Color output whenever possible
alias ls='ls --color=auto'
alias ip='ip --color=auto'

# Because systemctl is a nightmare to type *and* complete
if command -v systemctl >/dev/null; then
    alias sc="$SUDO systemctl"
    alias jc="$SUDO journalctl"
fi

# Aliases to allow me to reuse muscle memory from macOS usage
alias o=xdg-open
alias bat=batcat
alias fd=fdfind

# Color `ls` output whenever possible
alias ls='ls --color=auto'

# Because systemctl is a nightmare to type *and* complete
if command -v systemctl >/dev/null; then
    alias sc="$SUDO systemctl"
    alias jc="$SUDO journalctl"
fi


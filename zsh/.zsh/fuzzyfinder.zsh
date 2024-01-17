_load_fzf_config() {
    local basedir=$1
    if [[ -d "$basedir" ]]; then
        source "$basedir/completion.zsh"
        source "$basedir/key-bindings.zsh"
    fi
}

if [[ -n "$HOMEBREW_PREFIX" ]]; then
    _load_fzf_config "$HOMEBREW_PREFIX/opt/fzf/shell"
else
    _load_fzf_config /usr/share/doc/fzf/examples
fi

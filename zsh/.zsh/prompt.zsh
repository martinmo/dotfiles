# Load color variables
autoload -Uz colors && colors

# Enable variable substition in $PROMPT
setopt promptsubst

# Display a pretty EOL marker
PROMPT_EOL_MARK="%F{59}¬"

# Outputs current branch info in prompt format
function git_prompt_info() {
    local ref dirty
    ref="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)" || return 0
    if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
        dirty="%{$fg_bold[yellow]%}*"
    fi
    echo " %{$fg_bold[blue]%}git:(%{$fg_bold[red]%}$ref$dirty%{$fg_bold[blue]%})%{$reset_color%}"
}

# Arrow eye-catcher and red/green return status indicator
local arrow="%(?.%{$fg_bold[green]%}.%{$fg_bold[red]%})❯%{$reset_color%}"

# Configures a colorful prompt like '❯ dotfiles git:(master*) % '
PROMPT='${arrow} %{$fg_bold[cyan]%}%1~%{$reset_color%}$(git_prompt_info) %# '

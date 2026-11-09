# Shell integration for installed tools.

command -v fzf >/dev/null 2>&1 && eval "$(fzf --bash)"
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init bash)"
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook bash)"
command -v starship >/dev/null 2>&1 && eval "$(starship init bash)"
command -v hf >/dev/null 2>&1 && eval "$(_HF_COMPLETE=bash_source hf)"

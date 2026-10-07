# Shell integration for installed tools.

# fzf: Ctrl-T files, Ctrl-R history, Alt-C directories, ** completion.
command -v fzf >/dev/null 2>&1 && eval "$(fzf --bash)"

# direnv: loads and unloads .envrc on cd. Puts itself first in
# PROMPT_COMMAND, so __prompt stays last.
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook bash)"

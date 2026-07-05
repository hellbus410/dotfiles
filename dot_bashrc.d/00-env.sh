# Environment variables.

# Idempotently prepend to PROMPT_COMMAND: 10-history.sh and 20-prompt.sh
# both need this (hence living here, the one file guaranteed to load before
# either), so that manually re-sourcing ~/.bashrc doesn't pile up duplicate
# work (title-print, prompt-colour, history sync) on every prompt forever.
# zoxide/fzf's own init scripts already guard themselves this way; this
# gives our own PROMPT_COMMAND edits the same property.
__prompt_command_prepend() {
    case "${PROMPT_COMMAND:-}" in
        *"$1"*) ;;
        *) PROMPT_COMMAND="$1${PROMPT_COMMAND:+; $PROMPT_COMMAND}" ;;
    esac
}

# Homebrew: probe common install prefixes (Linuxbrew on Linux, Homebrew on
# macOS Apple Silicon / Intel) since brew isn't on PATH until this runs.
# Deliberately first in this file: nvim (below) and other brew-only tools
# elsewhere in .bashrc.d/ need brew's bin/ on PATH before they can be found
# by `command -v`. This bit us for real — nvim is brew-only here, and with
# this block last, the editor-detection loop below silently fell through to
# system `vi`.
for _brew in /home/linuxbrew/.linuxbrew/bin/brew /opt/homebrew/bin/brew /usr/local/bin/brew; do
    if [ -x "$_brew" ]; then
        eval "$("$_brew" shellenv)"
        break
    fi
done
unset _brew

# Prefer nvim > vim > vi as the default editor.
for _ed in nvim vim vi; do
    if command -v "$_ed" >/dev/null 2>&1; then
        export EDITOR="$_ed"
        export VISUAL="$_ed"
        break
    fi
done
unset _ed

# Homelab kube context, only if it actually exists on this machine.
[ -f "$HOME/.kube/config-homelab" ] && export KUBECONFIG="$HOME/.kube/config-homelab"

# Colorized man pages via bat. `col -bx` strips man's backspace-encoded
# bold/underline sequences before handing plain text to bat; -p drops bat's
# line numbers/grid decorations, which don't belong in a pager.
if command -v bat >/dev/null 2>&1 && command -v col >/dev/null 2>&1; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# git-prompt.sh display options (git-prompt.sh itself is loaded by
# 40-completions.sh; these are read by __git_ps1 if/when you call it).
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=auto

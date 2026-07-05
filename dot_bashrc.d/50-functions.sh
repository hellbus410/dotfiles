# mkdir + cd in one step.
mkcd() {
    mkdir -p -- "$1" && cd -- "$1"
}

# zoxide (z/zi: frecency-based cd). Safe to source anywhere in this file —
# its init script checks PROMPT_COMMAND for its own hook before appending,
# so it won't stomp the history/prompt hooks already set by other files.
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init bash)"

# fzf integration (Ctrl-T / Ctrl-R / Alt-C + ** completion trigger), using
# fd instead of the find fallback: respects .gitignore, much faster.
if command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type=d --hidden --strip-cwd-prefix --exclude .git'
fi
command -v fzf >/dev/null 2>&1 && eval "$(fzf --bash)"

# Extract almost any archive by type.
extract() {
    if [ -z "$1" ] || [ ! -f "$1" ]; then
        echo "usage: extract <archive>" >&2
        return 1
    fi
    case "$1" in
        *.tar.bz2|*.tbz2) tar xjf  "$1" ;;
        *.tar.gz|*.tgz)   tar xzf  "$1" ;;
        *.tar.xz)         tar xJf  "$1" ;;
        *.tar.zst)        tar --zstd -xf "$1" ;;
        *.tar)            tar xf   "$1" ;;
        *.gz)             gunzip   "$1" ;;
        *.bz2)            bunzip2  "$1" ;;
        *.zip)            unzip    "$1" ;;
        *.zst)            unzstd   "$1" ;;
        *) echo "extract: don't know how to handle '$1'" >&2; return 1 ;;
    esac
}

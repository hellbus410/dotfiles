# yazi: shadow the real binary with a function so plain `yazi` (no wrapper
# name to remember) leaves this shell cd'd into wherever you exited yazi,
# using the same persistent last-dir state that bin/yazi-cd also feeds/reads
# so the niri-launched (no persistent shell) and interactive-shell cases
# agree on "where yazi left off". Tmux-agnostic on purpose: this only touches
# the calling shell's $PWD, so it behaves identically inside or outside tmux.
if command -v yazi >/dev/null 2>&1 && [ -x "$HOME/.local/bin/yazi-cd" ]; then
    yazi() {
        "$HOME/.local/bin/yazi-cd" "$@" || return
        local state="${XDG_STATE_HOME:-$HOME/.local/state}/yazi/last-dir" cwd
        if cwd="$(cat -- "$state" 2>/dev/null)" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            builtin cd -- "$cwd"
        fi
    }
fi

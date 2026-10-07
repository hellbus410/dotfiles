# Environment.

# Linuxbrew first: nvim, bat, fzf and the rest below may come from it.
if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=nvim

# Man pages through bat: `col -bx` strips man's backspace formatting first.
if command -v bat >/dev/null 2>&1; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export GROFF_NO_SGR=1
fi

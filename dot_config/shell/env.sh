export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

mkdir -p "$XDG_CONFIG_HOME" "$XDG_CACHE_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME"
mkdir -p "$XDG_CACHE_HOME/zsh"

case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) PATH="$HOME/.local/bin:$PATH" ;;
esac
export PATH

if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if command -v nvim >/dev/null 2>&1; then
    export EDITOR=nvim
    export VISUAL=nvim
    export SUDO_EDITOR=nvim
elif command -v vim >/dev/null 2>&1; then
    export EDITOR=vim
    export VISUAL=vim
    export SUDO_EDITOR=vim
else
    export EDITOR=vi
    export VISUAL=vi
fi

if command -v bat >/dev/null 2>&1; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export GROFF_NO_SGR=1
elif command -v batcat >/dev/null 2>&1; then
    export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
    export GROFF_NO_SGR=1
fi

if [ -n "$SSH_CONNECTION" ] && [ -z "$TMUX" ] && [ -t 1 ]; then
    if command -v tmux >/dev/null 2>&1; then
        exec tmux new-session -A -s master
    fi
fi

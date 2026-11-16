# Vi mode for zsh line editor.

bindkey -v

bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char
bindkey -M viins '^W' backward-kill-word
bindkey -M viins '^U' backward-kill-line
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

_cursor_shape() {
    case $KEYMAP in
        vicmd) printf '\e[2 q' ;;
        *)     printf '\e[6 q' ;;
    esac
}
zle-keymap-select() { _cursor_shape }
zle-line-init() { _cursor_shape }
zle -N zle-keymap-select
zle -N zle-line-init

_cursor_reset() { printf '\e[2 q' }
autoload -U add-zsh-hook
add-zsh-hook preexec _cursor_reset

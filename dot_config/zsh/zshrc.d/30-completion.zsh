# Completion caching, styles, and menu navigation.

zmodload zsh/complist
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

_zcompdump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
autoload -U compinit
if [ -n "$(find "$_zcompdump" -mtime -1 2>/dev/null)" ]; then
    compinit -C -d "$_zcompdump"
else
    compinit -d "$_zcompdump"
fi
unset _zcompdump

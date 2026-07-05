# Custom aliases.

if command -v dircolors >/dev/null 2>&1; then
    if [ -r "$HOME/.dircolors" ]; then
        eval "$(dircolors -b "$HOME/.dircolors")"
    else
        eval "$(dircolors -b)"
    fi
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -lF --group-directories-first'
alias la='ls -AlF --group-directories-first'
alias l='ls -CF'

if command -v eza >/dev/null 2>&1; then
    alias ell='eza -l --classify=always --group-directories-first --git'
    alias ela='eza -lA --classify=always --group-directories-first --git'
fi

alias cls='clear'

alias v="$EDITOR"
alias k='kubectl'
alias h='helm'
alias t='tailscale'
alias g='git'

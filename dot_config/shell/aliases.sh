# Aliases for bash and zsh: sourced by ~/.bashrc and ~/.zshrc.
# Only syntax both shells share.

alias ll='ls -lF --group-directories-first'
alias la='ls -AlF --group-directories-first'
# alias l='ls -CF'

if command -v eza >/dev/null 2>&1; then
    alias ell='eza -l --classify=always --group-directories-first --git'
    alias ela='eza -lA --classify=always --group-directories-first --git'
fi

alias c='clear'
alias df='df -h'
alias du='du -h'

alias nos='nh os switch'
alias nob='nh os build'
alias nobu='nh os build -u'

alias v='nvim'
alias g='git'
alias l='lazygit'
alias k='kubectl'
alias tf='tofu'

# The trailing space makes the next word alias-expanded too: `sudo ll`.
alias sudo='sudo '

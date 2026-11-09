# History.

HISTCONTROL=ignoreboth:erasedups
HISTSIZE=1000000
HISTFILESIZE=1000000
export HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/bash_history"
HISTTIMEFORMAT='%F %T  '
HISTIGNORE='ls:l:ll:la:eza:ell:ela:cd:pwd:tree:bg:fg:uptime:date:df:free:history:clear:c:exit:top:htop:btop:nvtop:help:*password*:*secret*:*AWS_KEY*'

shopt -s histappend cmdhist checkwinsize
PROMPT_COMMAND="history -a; ${PROMPT_COMMAND:-}"

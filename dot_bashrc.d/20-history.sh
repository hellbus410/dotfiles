# History. The file is written after every command by __prompt (30-prompt.sh).

HISTCONTROL=ignoreboth:erasedups
HISTSIZE=100000
HISTFILESIZE=200000
HISTTIMEFORMAT='%F %T  '
HISTIGNORE='ls:l:ll:la:eza:ell:ela:cd:pwd:tree:bg:fg:uptime:date:df:free:history:clear:c:exit:top:htop:btop:nvtop:help:*password*:*secret*:*AWS_KEY*'

shopt -s histappend cmdhist checkwinsize

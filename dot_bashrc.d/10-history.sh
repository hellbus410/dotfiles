# History settings.

HISTCONTROL=ignoreboth:erasedups
HISTSIZE=100000
HISTFILESIZE=200000
HISTTIMEFORMAT='%F %T  '

# Every command below is listed twice: bare (matches only a no-argument
# invocation) and with a trailing space + "*" (matches with args/flags/pipes).
# A single "ls*" would also swallow unrelated commands like lsblk/lsof/lsusb,
# so each pattern requires either an exact match or a space after it.
HISTIGNORE='ls:l:ll:la:ell:ela:cd:pwd:tree:bg:fg:uptime:date:df:free:history:clear:cls:exit:top:htop:btop:nvtop:help:man:man *:*password*:*secret*:*AWS_KEY*'

shopt -s histappend cmdhist

# Share history live across open terminals.
__prompt_command_prepend 'history -a; history -n'

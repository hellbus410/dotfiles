# History settings.

HISTCONTROL=ignoreboth:erasedups
HISTSIZE=100000
HISTFILESIZE=200000
HISTTIMEFORMAT='%F %T  '

# Every command below is listed twice: bare (matches only a no-argument
# invocation) and with a trailing space + "*" (matches with args/flags/pipes).
# A single "ls*" would also swallow unrelated commands like lsblk/lsof/lsusb,
# so each pattern requires either an exact match or a space after it.
HISTIGNORE='ls:ls *:ll:ll *:la:la *:cd:cd *:pwd:pwd *:tree:tree *:bg:bg *:fg:fg *:uptime:uptime *:date:date *:df:df *:free:free *:history:history *:clear:clear *:cls:cls *:exit:exit *:top:top *:htop:htop *:btop:btop *:nvtop:nvtop *:help:help *:man:man *:*password*:*secret*:*AWS_KEY*'

shopt -s histappend cmdhist

# Share history live across open terminals.
__prompt_command_prepend 'history -a; history -n'

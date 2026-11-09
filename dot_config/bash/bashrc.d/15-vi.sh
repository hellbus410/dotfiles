# Vi mode for readline.

set -o vi

bind 'set show-mode-in-prompt off'
bind 'set vi-ins-mode-string \1\e[6 q\2'
bind 'set vi-cmd-mode-string \1\e[2 q\2'

PS0='\[\e[2 q\]'

bind -m vi-insert '"\C-a": beginning-of-line'
bind -m vi-insert '"\C-e": end-of-line'
bind -m vi-insert '"\C-w": backward-kill-word'
bind -m vi-insert '"\C-u": unix-line-discard'

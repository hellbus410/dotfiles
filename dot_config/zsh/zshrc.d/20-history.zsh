# History settings.

setopt append_history inc_append_history share_history
setopt hist_ignore_dups hist_ignore_space hist_reduce_blanks
setopt extended_history

HISTSIZE=1000000
SAVEHIST=1000000
export HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh_history"

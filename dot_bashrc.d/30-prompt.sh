# Prompt, laid out like oh-my-bash's powerbash10k:
#    ~/dir  git  branch ·········· ✘ 1   3s  user@host   12:34:56
#   ❯
# Needs a Nerd Font for the icons.

# __git_ps1 comes from git's contrib directory: Fedora, then NixOS.
for _f in /usr/share/git-core/contrib/completion/git-prompt.sh \
          /run/current-system/sw/share/bash-completion/completions/git-prompt.sh; do
    if [ -r "$_f" ]; then
        . "$_f"
        break
    fi
done
unset _f

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=auto

_p_reset=$(tput sgr0)
_p_red=$(tput bold; tput setaf 1)
_p_green=$(tput bold; tput setaf 2)
_p_yellow=$(tput bold; tput setaf 3)
_p_blue=$(tput bold; tput setaf 4)
_p_white=$(tput bold; tput setaf 7)
_p_dim=$(tput setaf 8)

# Start time of the running command; the DEBUG trap fires before every
# simple command, and ${:-} keeps the first, so a pipeline is timed whole.
trap '_p_start=${_p_start:-$SECONDS}' DEBUG

__prompt() {
    local exit=$? elapsed=$(( SECONDS - ${_p_start:-$SECONDS} ))
    unset _p_start
    history -a

    local plain="" right="" now fill
    if (( exit != 0 )); then
        plain+=" ✘ $exit"
        right+=" ${_p_red}✘ $exit"
    fi
    if (( elapsed > 0 )); then
        local d
        if (( elapsed >= 3600 )); then
            d="$(( elapsed / 3600 ))h $(( elapsed / 60 % 60 ))m $(( elapsed % 60 ))s"
        elif (( elapsed >= 60 )); then
            d="$(( elapsed / 60 ))m $(( elapsed % 60 ))s"
        else
            d="${elapsed}s"
        fi
        plain+=" "$''" $d"
        right+=" ${_p_blue}"$''" $d"
    fi
    plain+=" $USER@${HOSTNAME%%.*}"
    right+=" ${_p_yellow}$USER@${HOSTNAME%%.*}"
    printf -v now '%(%H:%M:%S)T' -1
    plain+=" "$''" $now"
    right+=" ${_p_white}"$''" $now"

    # A full line of dots ending in the right part, drawn with the cursor
    # saved (\e7) and restored (\e8); the left part is then printed over it.
    local width=$(( COLUMNS - ${#plain} ))
    (( width < 0 )) && width=0
    printf -v fill '%*s' "$width" ''
    _p_top=$'\e7'"${_p_dim}${fill// /·}${right}${_p_reset}"$'\e8'

    _p_git=""
    declare -F __git_ps1 >/dev/null && _p_git=$(__git_ps1 "  "$''" %s")

    if (( exit == 0 )); then _p_char=$_p_green; else _p_char=$_p_red; fi
}

# Appended, keeping what /etc/bashrc put there (the terminal title). Must be
# the last entry: the DEBUG trap fires for each entry, and one after
# __prompt would restart the timer. Every entry sees the command's $?.
PROMPT_COMMAND+=(__prompt)

# Changing parts are referenced as ${...} in single quotes, so they expand
# when the prompt is drawn and a branch name is never parsed as code.
PS1='\[${_p_top}\]\[${_p_blue}\]'$''' \w\[${_p_green}\]${_p_git}\[${_p_reset}\]\n\[${_p_char}\]❯\[${_p_reset}\] '
PS2='\[${_p_white}\]\\\[${_p_reset}\] '

# Colours taken from pure bash

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT_BLACK=$(tput setaf 8)
BRIGHT_RED=$(tput setaf 9)
BRIGHT_GREEN=$(tput setaf 10)
BRIGHT_YELLOW=$(tput setaf 11)
BRIGHT_BLUE=$(tput setaf 12)
BRIGHT_MAGENTA=$(tput setaf 13)
BRIGHT_CYAN=$(tput setaf 14)
BRIGHT_WHITE=$(tput setaf 15)
RESET=$(tput sgr0)

pure_prompt_symbol="❯"
pure_symbol_unpulled="⇣"
pure_symbol_unpushed="⇡"
pure_symbol_dirty="*"

# Prompt colour flips to red after a failing command.
__pure_echo_prompt_color() {
    if [[ $? = 0 ]]; then
        echo "${pure_user_color}"
    else
        echo "${RED}"
    fi
}

__pure_update_prompt_color() {
    pure_prompt_color=$(__pure_echo_prompt_color)
}

case ${UID} in
    0) pure_user_color=${BRIGHT_BLUE} ;;
    *) pure_user_color=${BRIGHT_BLUE} ;;
esac

__prompt_command_prepend '__pure_update_prompt_color'

FIRST_LINE="${CYAN}\w \n"
# Do not inline $pure_prompt_color directly here (raw expansion instead of
# \[...\] causes bash to miscount the prompt width and corrupt in-place
# history editing with the up-arrow key) — keep it as a deferred \${...} ref.
SECOND_LINE="\[\${pure_prompt_color}\]${pure_prompt_symbol}\[$RESET\] "
PS1="\n${FIRST_LINE}${SECOND_LINE}"
# Upstream pure.bash references an undefined $prompt_symbol here, leaving PS2
# blank; using pure_prompt_symbol instead so continuation lines show a glyph.
PS2="\[$BLUE\]${pure_prompt_symbol}\[$RESET\] "

# Terminal tab title.
__prompt_command_prepend "printf '\033]0;%s\007' 'foot'"

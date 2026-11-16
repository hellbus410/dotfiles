#!/bin/sh

has_bash=0
has_zsh=0
command -v bash >/dev/null 2>&1 && has_bash=1
command -v zsh >/dev/null 2>&1 && has_zsh=1

if [ "$has_bash" -eq 0 ] && [ "$has_zsh" -eq 0 ]; then
    exit 0
fi

missing=""

check_tool() {
    _cmd="$1"
    _label="$2"
    _desc="$3"
    if ! command -v "$_cmd" >/dev/null 2>&1; then
        missing="${missing}
  - $(printf '%-14s' "$_label") $_desc"
    fi
}

check_tool "starship" "starship" "Prompt renderer"
check_tool "atuin"    "atuin"    "Shell history search (Ctrl+R)"
check_tool "fzf"      "fzf"      "Fuzzy finder (Ctrl+T, Alt+C)"
check_tool "zoxide"   "zoxide"   "Fast directory navigation (z)"
check_tool "direnv"   "direnv"   "Per-directory environment loader"
check_tool "nvim"     "nvim"     "Default editor (\$EDITOR / \$VISUAL / v alias)"

if ! command -v bat >/dev/null 2>&1 && ! command -v batcat >/dev/null 2>&1; then
    missing="${missing}
  - $(printf '%-14s' "bat") Syntax-highlighted man pager (\$MANPAGER)"
fi

check_tool "eza"      "eza"      "Modern file listing aliases (ell, ela)"
check_tool "lazygit"  "lazygit"  "Git terminal UI (l alias)"
check_tool "kubectl"  "kubectl"  "Kubernetes CLI (k alias and completions)"

if ! command -v tofu >/dev/null 2>&1 && ! command -v terraform >/dev/null 2>&1; then
    missing="${missing}
  - $(printf '%-14s' "tofu/terraform") OpenTofu or Terraform CLI (tf alias and completions)"
fi

if [ -n "$missing" ]; then
    if [ "$has_bash" -eq 1 ] && [ "$has_zsh" -eq 1 ]; then
        _shell_label="bash & zsh"
    elif [ "$has_bash" -eq 1 ]; then
        _shell_label="bash"
    else
        _shell_label="zsh"
    fi

    printf '\n[chezmoi] Shell profile (%s): the following tool(s) are missing and should be installed:%s\n\n' "$_shell_label" "$missing"
fi

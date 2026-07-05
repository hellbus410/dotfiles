# Completions.

# bash-completion framework: Linux system path, XDG user dir, or Homebrew's
# bash-completion@2 formula on macOS. First one found wins.
if shopt -q progcomp; then
    _bc=""
    for _cand in \
        /usr/share/bash-completion/bash_completion \
        /etc/bash_completion \
        "$(command -v brew >/dev/null 2>&1 && brew --prefix bash-completion@2 2>/dev/null)/etc/profile.d/bash_completion.sh"
    do
        if [ -n "$_cand" ] && [ -r "$_cand" ]; then
            _bc="$_cand"
            break
        fi
    done
    [ -n "$_bc" ] && . "$_bc"
    unset _bc _cand
fi
# Per-user extra completions (e.g. ~/.config/bash_completion).
[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/bash_completion" ] && . "${XDG_CONFIG_HOME:-$HOME/.config}/bash_completion"

# git branch/status helper (used if you call __git_ps1 from 20-prompt.sh).
for _f in /usr/share/git-core/contrib/completion/git-prompt.sh \
          /usr/share/git/completion/git-prompt.sh \
          /etc/bash_completion.d/git-prompt \
          "$(command -v brew >/dev/null 2>&1 && brew --prefix)/etc/bash_completion.d/git-prompt.sh"; do
    [ -n "$_f" ] && [ -r "$_f" ] && . "$_f" && break
done
unset _f

# kubectl / helm
command -v kubectl >/dev/null 2>&1 && source <(kubectl completion bash)
complete -o default -F __start_kubectl k 2>/dev/null
command -v helm >/dev/null 2>&1 && source <(helm completion bash)

# flatpak ships /usr/share/bash-completion/completions/flatpak, which the
# bash-completion framework above loads on demand — nothing else to do here.

# Homebrew-managed tool completions (ripgrep, eza, bat, fd, gh, ... whatever
# you've brewed). Homebrew's own completions aren't linked into the framework
# by default, so source each file directly.
if command -v brew >/dev/null 2>&1; then
    _brew_prefix="$(brew --prefix)"
    if [ -d "$_brew_prefix/etc/bash_completion.d" ]; then
        for _f in "$_brew_prefix/etc/bash_completion.d/"*; do
            [ -r "$_f" ] && . "$_f"
        done
    fi
    unset _f _brew_prefix
fi

# claude (Claude Code CLI): no completion subcommand or generator upstream,
# so this only covers top-level subcommands, not flags/values.
if command -v claude >/dev/null 2>&1; then
    _claude_completions() {
        local cur cmds
        cur="${COMP_WORDS[COMP_CWORD]}"
        cmds="agents auth auto-mode doctor gateway install mcp plugin plugins project setup-token ultrareview update upgrade"
        COMPREPLY=($(compgen -W "$cmds" -- "$cur"))
    }
    complete -F _claude_completions claude
fi

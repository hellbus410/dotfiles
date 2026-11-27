# Completions for project-scoped CLI tools (loaded lazily when direnv provides them).

_lazy_kubectl_completion() {
    command -v kubectl >/dev/null 2>&1 || return 1
    unfunction _lazy_kubectl_completion
    source <(kubectl completion zsh)
    compdef _kubectl kubectl k
    _kubectl "$@"
}
compdef _lazy_kubectl_completion kubectl k 2>/dev/null || true

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C tofu tofu tf 2>/dev/null || true

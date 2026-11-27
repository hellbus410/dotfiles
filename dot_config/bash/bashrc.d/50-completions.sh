# Completions for project-scoped CLI tools (loaded lazily when direnv provides them).

_lazy_kubectl_completion() {
    command -v kubectl >/dev/null 2>&1 || return 1
    unset -f _lazy_kubectl_completion
    eval "$(kubectl completion bash 2>/dev/null)"
    complete -o default -F __start_kubectl k 2>/dev/null || true
    if declare -F __start_kubectl >/dev/null 2>&1; then
        __start_kubectl "$@"
    fi
}
complete -o default -F _lazy_kubectl_completion kubectl k 2>/dev/null || true
complete -C tofu tofu tf 2>/dev/null || true

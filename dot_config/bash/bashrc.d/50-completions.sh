# Completions for aliases.

if command -v kubectl >/dev/null 2>&1; then
    complete -o default -F __start_kubectl k 2>/dev/null || true
fi
if command -v tofu >/dev/null 2>&1; then
    complete -C tofu tf 2>/dev/null || true
    complete -C tofu tofu 2>/dev/null || true
elif command -v terraform >/dev/null 2>&1; then
    complete -C terraform tf 2>/dev/null || true
    complete -C terraform terraform 2>/dev/null || true
fi

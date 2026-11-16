# Completions for aliases.

command -v kubectl >/dev/null 2>&1 && compdef k=kubectl 2>/dev/null || true

if command -v tofu >/dev/null 2>&1; then
    autoload -U +X bashcompinit && bashcompinit
    complete -o nospace -C tofu tofu tf 2>/dev/null || true
elif command -v terraform >/dev/null 2>&1; then
    autoload -U +X bashcompinit && bashcompinit
    complete -o nospace -C terraform terraform tf 2>/dev/null || true
fi

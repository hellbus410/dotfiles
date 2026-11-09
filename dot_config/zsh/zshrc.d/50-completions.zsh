# Completions for aliases.

compdef k=kubectl 2>/dev/null || true
compdef tf=tofu 2>/dev/null || compdef tf=terraform 2>/dev/null || true

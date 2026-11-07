-- File dialogs: yazi in kitty (xdg-desktop-portal-termfilechooser), floating like Caelestia's GTK dialogs
hl.window_rule({ match = { class = "^termfilechooser$" }, tag = "+float_60_70" })

-- Special Scratchpads

-- Telegram
hl.window_rule({
    match           = { class = "^org\\.telegram\\.desktop$" },
    workspace       = "special:telegram silent",
    no_screen_share = true,
})

-- Proton Mail
-- !!! DOESN'T have tray option - close program actually close it, even inside scratchpad
hl.window_rule({
    match           = { class = "^proton-mail$" },
    workspace       = "special:mail silent",
    no_screen_share = true,
})

-- 1Password
hl.window_rule({
    match           = { class = "^(com\\.onepassword\\.OnePassword|1password)$" },
    workspace       = "special:1password silent",
    no_screen_share = true,
})

-- Vesktop|Discord
-- special workspace already in Caelestia-shell
hl.window_rule({
    match           = { class = "^(vesktop|discord)$" },
    no_screen_share = true,
})

-- Authentication and credential prompts
hl.window_rule({
    match           = { class = "^(hyprpolkitagent|polkit-.*|.*polkit.*|gcr-prompter|pinentry.*)$" },
    no_screen_share = true,
})

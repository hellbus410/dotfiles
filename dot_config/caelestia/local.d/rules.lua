-- File dialogs: yazi in kitty (xdg-desktop-portal-termfilechooser), floating like Caelestia's GTK dialogs
hl.window_rule({ match = { class = "^termfilechooser$" }, tag = "+float_60_70" })

-- Special Scratchpads
-- Vesktop's come with Caelestia-shell

-- Telegram, (SUPER + T) with silent autostart
hl.window_rule({ match = { class = "^org\\.telegram\\.desktop$" }, workspace = "special:telegram silent" })

-- Proton Mail (SUPER + M) with silent autostart
-- !!! DOESN'T have tray option - close program actually close it, even inside scratchpad
hl.window_rule({ match = { class = "^proton-mail$" }, workspace = "special:mail silent" })

-- Autostart (alongside Caelestia's own list in hyprland/execs.lua)
hl.on("hyprland.start", function()
    hl.exec_cmd("1password --silent") -- straight to tray, keeps SSH agent / browser unlock available
    hl.exec_cmd("tmux new -A -d -s master") -- starts the tmux server to let continuum restore in background
    hl.exec_cmd("Telegram") -- hidden in special:telegram like Vesktop
    hl.exec_cmd("proton-mail") -- no close-to-tray, so it lives hidden in special:mail to keep mail notifications coming
end)

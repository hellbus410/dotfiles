-- Autostart (alongside Caelestia's own list in hyprland/execs.lua)
local function exec_if_installed(bin, cmd)
    hl.exec_cmd("command -v " .. bin .. " >/dev/null 2>&1 && " .. (cmd or bin))
end

hl.on("hyprland.start", function()
    exec_if_installed("1password", "1password --silent") -- straight to tray, keeps SSH agent / browser unlock available
    exec_if_installed("tmux", "tmux new -A -d -s master") -- starts the tmux server to let continuum restore in background
    exec_if_installed("Telegram") -- hidden in special:telegram like Vesktop
    exec_if_installed("proton-mail") -- no close-to-tray, so it lives hidden in special:mail to keep mail notifications coming
    exec_if_installed("emacs", "env COLORTERM=truecolor emacs --bg-daemon")
end)

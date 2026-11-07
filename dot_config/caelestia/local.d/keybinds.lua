-- Binds that have no variable in variables.lua. Every line ends with what Caelestia's
-- default config puts on that key and the niri bind (~/.config/niri/local.d/keybinds.kdl);
-- "none" = nothing on that key.

-- Apps
hl.bind("SUPER + ALT + Return", require("utils.functions").toggle("term"))                                -- default: none | niri: Mod+ALT+Return
hl.bind("SUPER + P", hl.dsp.exec_cmd("1password"))                                                      -- default: pin window | niri: Mod+P
hl.bind("SUPER + ALT + B", hl.dsp.exec_cmd("qutebrowser"))                                              -- default: none | niri: Mod+ALT+B
hl.bind("SUPER + ALT + E", hl.dsp.exec_cmd("nautilus"))                                               -- default: none | niri: none (SUPER + E is nautilus, kbFileExplorer)
hl.bind("SUPER + O", hl.dsp.exec_cmd("zennotes-desktop"))                                                       -- default: none | niri: Mod+O
hl.bind("SUPER + ALT + O", hl.dsp.exec_cmd("obsidian"))                                                       -- default: none | niri: Mod+O
hl.bind("SUPER + SHIFT + O", hl.dsp.exec_cmd("pwvucontrol"))                                                 -- default: none | niri: none
hl.bind("SUPER + T", require("utils.functions").toggle("telegram"))                                       -- default: terminal (scratchpad, see bottom) | niri: Mod+T
hl.bind("SUPER + M", require("utils.functions").toggle("mail"))                                           -- default: music scratchpad (moved to SUPER + ALT + M) | niri: Mod+M
hl.bind("SUPER + A", hl.dsp.exec_cmd("kitty tmux new -A -s ai"))                                 -- default: none | niri: Mod+ALT+A

-- Focus windows (SUPER + arrows already focus, in keybinds.lua)
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))                                              -- default: none | niri: Mod+H
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))                                              -- default: ungroup | niri: Mod+U
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))                                                -- default: none | niri: Mod+I
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))                                             -- default: lock | niri: Mod+L

-- Move windows
hl.bind("CTRL + SUPER + H", hl.dsp.window.move({ direction = "left" }))                                 -- default: none | niri: Mod+CTRL+H
hl.bind("CTRL + SUPER + J", hl.dsp.window.move({ direction = "down" }))                                 -- default: none | niri: Mod+CTRL+U
hl.bind("CTRL + SUPER + K", hl.dsp.window.move({ direction = "up" }))                                   -- default: none | niri: Mod+CTRL+I
hl.bind("CTRL + SUPER + L", hl.dsp.window.move({ direction = "right" }))                                -- default: none | niri: Mod+CTRL+L

-- keybinds.lua unbinds 
hl.unbind("SUPER + left")                                                                               -- default: none | niri: Mod+H
hl.unbind("SUPER + right")                                                                              -- default: ungroup | niri: Mod+U
hl.unbind("SUPER + up")                                                                                 -- default: none | niri: Mod+I
hl.unbind("SUPER + down")                                                                               -- default: lock | niri: Mod+L

hl.unbind("SUPER + SHIFT + left")                                                                       -- default: move window left | niri: Mod+Shift+Left focused the monitor
hl.unbind("SUPER + SHIFT + right")                                                                      -- default: move window right | niri: Mod+Shift+Right focused the monitor
hl.unbind("SUPER + SHIFT + up")                                                                         -- default: move window up | niri: Mod+Shift+Up focused the monitor
hl.unbind("SUPER + SHIFT + down")                                                                       -- default: move window down | niri: Mod+Shift+Down focused the monitor

-- Focus monitors
hl.bind("SUPER + SHIFT + H", hl.dsp.focus({ monitor = "left" }))                                        -- default: none | niri: Mod+Shift+H
hl.bind("SUPER + SHIFT + J", hl.dsp.focus({ monitor = "down" }))                                        -- default: none | niri: Mod+Shift+J
hl.bind("SUPER + SHIFT + K", hl.dsp.focus({ monitor = "up" }))                                          -- default: none | niri: Mod+Shift+K
hl.bind("SUPER + SHIFT + L", hl.dsp.focus({ monitor = "right" }))                                       -- default: sleep | niri: Mod+Shift+L

-- Move windows to monitors
hl.bind("CTRL + SUPER + SHIFT + H", hl.dsp.window.move({ monitor = "left" }))                           -- default: none | niri: Mod+Shift+CTRL+H
hl.bind("CTRL + SUPER + SHIFT + J", hl.dsp.window.move({ monitor = "down" }))                           -- default: none | niri: Mod+Shift+CTRL+J
hl.bind("CTRL + SUPER + SHIFT + K", hl.dsp.window.move({ monitor = "up" }))                             -- default: none | niri: Mod+Shift+CTRL+K
hl.bind("CTRL + SUPER + SHIFT + L", hl.dsp.window.move({ monitor = "right" }))                          -- default: none | niri: Mod+Shift+CTRL+L

-- Shell kill and restart
hl.unbind("CTRL + SUPER + SHIFT + R")                                                                   -- default: kill the shell with qs | niri: none
hl.unbind("CTRL + SUPER + ALT + R")                                                                     -- default: restart the shell with qs | niri: none
hl.bind("CTRL + SUPER + SHIFT + R", hl.dsp.exec_cmd("caelestia shell -k"), { release = true })          -- default: kill the shell | niri: none
hl.bind("CTRL + SUPER + ALT + R", hl.dsp.exec_cmd("caelestia shell -r"), { release = true })            -- default: restart the shell | niri: none

-- Screenshots
hl.bind("SUPER + SHIFT + S", hl.dsp.global("caelestia:screenshotFreezeClip"))                           -- default: same key, opens swappy | niri: Mod+Shift+S

-- Shell panels
hl.bind("SUPER + SHIFT + D", hl.dsp.global("caelestia:dashboard"))                                      -- default: none | niri: none
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("caelestia shell drawers toggle bar"))                     -- default: none | niri: none
hl.bind("SUPER + SHIFT + N", hl.dsp.global("caelestia:nexus"))                                          -- default: none | niri: none

-- Power profiles
hl.bind("CTRL + SHIFT + F1", hl.dsp.exec_cmd("powerprofilesctl set power-saver; caelestia shell toaster info 'Power Profile' 'Quiet' 'energy_savings_leaf'"), { locked = true })
hl.bind("CTRL + SHIFT + F2", hl.dsp.exec_cmd("powerprofilesctl set balanced; caelestia shell toaster info 'Power Profile' 'Balanced' 'balance'"), { locked = true })
hl.bind("CTRL + SHIFT + F3", hl.dsp.exec_cmd("powerprofilesctl set performance; caelestia shell toaster info 'Power Profile' 'Performance' 'speed'"), { locked = true })

-- Scratchpad toggle
hl.bind("SUPER + W", function()                                                                         -- default: browser | niri: none
    local win = hl.get_active_window()
    if not win then return end

    if win.workspace and win.workspace.special then
        hl.dispatch(hl.dsp.window.move({ workspace = "e+0" }))
    else
        hl.dispatch(hl.dsp.window.move({ workspace = "special:special" }))
    end
end)

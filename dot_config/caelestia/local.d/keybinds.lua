-- Binds that have no variable in variables.lua.

-- Apps
hl.bind("SUPER + ALT + Return", hl.dsp.exec_cmd("foot"))
hl.bind("SUPER + P", require("utils.functions").toggle("1password"))
hl.bind("SUPER + ALT + B", hl.dsp.exec_cmd("qutebrowser"))
hl.bind("SUPER + ALT + E", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER + O", hl.dsp.exec_cmd("zennotes-desktop"))
hl.bind("SUPER + ALT + O", hl.dsp.exec_cmd("obsidian"))
hl.bind("SUPER + SHIFT + O", hl.dsp.exec_cmd("pwvucontrol"))
hl.bind("SUPER + T", require("utils.functions").toggle("telegram"))
hl.bind("SUPER + M", require("utils.functions").toggle("mail"))
hl.bind("SUPER + A", hl.dsp.exec_cmd("foot -e tmux new -A -s ai"))
hl.bind("SUPER + ALT + A", hl.dsp.exec_cmd("hermes-desktop"))

-- Focus windows (SUPER + arrows already focus, in keybinds.lua)
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

-- Move windows
hl.bind("CTRL + SUPER + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("CTRL + SUPER + J", hl.dsp.window.move({ direction = "down" }))
hl.bind("CTRL + SUPER + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("CTRL + SUPER + L", hl.dsp.window.move({ direction = "right" }))

-- keybinds.lua unbinds 
hl.unbind("SUPER + left")
hl.unbind("SUPER + right")
hl.unbind("SUPER + up")
hl.unbind("SUPER + down")

hl.unbind("SUPER + SHIFT + left")
hl.unbind("SUPER + SHIFT + right")
hl.unbind("SUPER + SHIFT + up")
hl.unbind("SUPER + SHIFT + down")

-- Focus monitors
hl.bind("SUPER + SHIFT + H", hl.dsp.focus({ monitor = "left" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.focus({ monitor = "down" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.focus({ monitor = "up" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.focus({ monitor = "right" }))

-- Move windows to monitors
hl.bind("CTRL + SUPER + SHIFT + H", hl.dsp.window.move({ monitor = "left" }))
hl.bind("CTRL + SUPER + SHIFT + J", hl.dsp.window.move({ monitor = "down" }))
hl.bind("CTRL + SUPER + SHIFT + K", hl.dsp.window.move({ monitor = "up" }))
hl.bind("CTRL + SUPER + SHIFT + L", hl.dsp.window.move({ monitor = "right" }))

-- Shell kill and restart
hl.unbind("CTRL + SUPER + SHIFT + R")
hl.unbind("CTRL + SUPER + ALT + R")
hl.bind("CTRL + SUPER + SHIFT + R", hl.dsp.exec_cmd("caelestia shell -k"), { release = true })
hl.bind("CTRL + SUPER + ALT + R", hl.dsp.exec_cmd("caelestia shell -r"), { release = true })

-- Screenshots
hl.bind("SUPER + SHIFT + S", hl.dsp.global("caelestia:screenshotFreezeClip"))

-- Shell panels
hl.bind("SUPER + SHIFT + D", hl.dsp.global("caelestia:dashboard"))
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("caelestia shell drawers toggle bar"))
hl.bind("SUPER + SHIFT + N", hl.dsp.global("caelestia:nexus"))

-- Power profiles
hl.bind("CTRL + SHIFT + F1", hl.dsp.exec_cmd("powerprofilesctl set power-saver; caelestia shell toaster info 'Power Profile' 'Quiet' 'energy_savings_leaf'"), { locked = true })
hl.bind("CTRL + SHIFT + F2", hl.dsp.exec_cmd("powerprofilesctl set balanced; caelestia shell toaster info 'Power Profile' 'Balanced' 'balance'"), { locked = true })
hl.bind("CTRL + SHIFT + F3", hl.dsp.exec_cmd("powerprofilesctl set performance; caelestia shell toaster info 'Power Profile' 'Performance' 'speed'"), { locked = true })

-- Scratchpad toggle
hl.bind("SUPER + W", function()
    local win = hl.get_active_window()
    if not win then return end

    if win.workspace and win.workspace.special then
        hl.dispatch(hl.dsp.window.move({ workspace = "e+0" }))
    else
        hl.dispatch(hl.dsp.window.move({ workspace = "special:special" }))
    end
end)

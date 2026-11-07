-- Laptop default layout
hl.workspace_rule({ workspace = "m[eDP-1]", layout = "dwindle" })

-- Laptop screen: disable when lid is closed with external display connected, lock when undocked
local internal_display = "eDP-1"

local function has_external_monitor()
    for _, mon in ipairs(hl.get_monitors({ all = true })) do
        if mon.name ~= internal_display and mon.enabled then
            return true
        end
    end
    return false
end

hl.bind("switch:on:Lid Switch", function()
    if has_external_monitor() then
        hl.monitor({ output = internal_display, disabled = true })
    else
        hl.dispatch(hl.dsp.global("caelestia:lock"))
    end
end, { locked = true })

hl.bind("switch:off:Lid Switch", function()
    hl.monitor({
        output   = internal_display,
        disabled = false,
        mode     = "preferred",
        position = "auto",
        scale    = 1,
    })
end, { locked = true })

-- Layout: centered master for ultrawide and 4K+ displays.
-- Standard displays (1080p, 1440p 16:9, laptop screens) default to dwindle.
hl.config({
    general = {
        layout = "dwindle",
    },
    master = {
        orientation                   = "center",
        slave_count_for_center_master = 0,      -- centre the master even with one side window
        always_keep_position          = true,   -- keep it centred when it's the only window
        mfact                         = 0.5,    -- master takes half the width
        new_status                    = "slave", -- new windows open at the sides, not as master
        smart_resizing                = true,
    },
    dwindle = {
        force_split = 2, -- new window takes the right (or bottom) half of the split
    },
})

-- Dynamic layout selection: apply centered master on ultrawide (>= 2.0 aspect ratio)
-- or 4K+ (>= 3840x2160) displays; dwindle on all other monitors.
local function configure_monitor_layouts()
    for _, mon in ipairs(hl.get_monitors({ all = true })) do
        if mon.width > 0 and mon.height > 0 then
            local is_ultrawide = (mon.width / mon.height) >= 2.0
            local is_4k_plus = (mon.width >= 3840 and mon.height >= 2160)
            local target_layout = (is_ultrawide or is_4k_plus) and "master" or "dwindle"

            hl.workspace_rule({
                workspace = "m[" .. mon.name .. "]",
                layout    = target_layout,
            })
        end
    end
end

configure_monitor_layouts()
hl.on("monitor.added", configure_monitor_layouts)
hl.on("monitor.layout_changed", configure_monitor_layouts)

-- Group tab bar: narrow Maple, the UI font (Caelestia: JetBrains Mono NF)
hl.config({ group = { groupbar = { font_family = "Maple Mono NR NF" } } })

-- Workspaces slide up/down instead of left/right (Caelestia: default horizontal slide, same speed and curve)
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "standard", style = "slidevert" })

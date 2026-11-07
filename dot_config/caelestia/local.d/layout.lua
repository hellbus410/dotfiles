-- Layout: centered master for the ultrawide. Main window stays in the middle,
-- new windows go to the sides (alternating right/left).
hl.config({
    general = {
        layout = "master",
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

-- Group tab bar: narrow Maple, the UI font (Caelestia: JetBrains Mono NF)
hl.config({ group = { groupbar = { font_family = "Maple Mono NR NF" } } })

-- Workspaces slide up/down instead of left/right (Caelestia: default horizontal slide, same speed and curve)
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "standard", style = "slidevert" })

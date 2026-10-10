-- swayimg config (defaults: /nix/store/*-swayimg-*/share/swayimg/example.lua)
-- Viewer:  j/k or PgDown/PgUp = next/previous image, h or t = hide the info text, Enter = gallery
-- Gallery: h/j/k/l or arrows = move, Enter = open

-- Opened with one file (yazi, xdg-open): also load the rest of its folder
swayimg.imagelist.adjacent = true

-- "monospace" resolves to Terminess, which swayimg renders as thin broken lines
swayimg.text.font = "BlexMono Nerd Font"

local function toggle_text()
    swayimg.text.visible = not swayimg.text.visible
end

swayimg.viewer.on_key("j", function() swayimg.viewer.open("next") end)
swayimg.viewer.on_key("k", function() swayimg.viewer.open("prev") end)
swayimg.viewer.on_key("h", toggle_text)

swayimg.gallery.on_key("h", function() swayimg.gallery.select("left") end)
swayimg.gallery.on_key("j", function() swayimg.gallery.select("down") end)
swayimg.gallery.on_key("k", function() swayimg.gallery.select("up") end)
swayimg.gallery.on_key("l", function() swayimg.gallery.select("right") end)

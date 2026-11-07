-- Focus: after closing a window, focus the next window instead of whatever is under the
-- cursor (Caelestia's 1 leaves nothing focused when the cursor is over a gap or the bar)
hl.config({
    input = {
        focus_on_close = 0,
    },
})

-- Cursor: hide the pointer in every app while typing; it comes back when the mouse moves
hl.config({
    cursor = {
        hide_on_key_press = true,
    },
})

-- ~/.config/caelestia/hypr-user.lua
-- Loaded last by ~/.config/hypr/hyprland.lua.
-- Binds that have no variable in variables.lua. Every line ends with what Caelestia's
-- default config puts on that key and the niri bind (~/.config/niri/local.d/keybinds.kdl);
-- "none" = nothing on that key.

-- Apps
hl.bind("SUPER + ALT + Return", require("utils.functions").toggle("term"))                                -- default: none | niri: Mod+ALT+Return
hl.bind("SUPER + P", hl.dsp.exec_cmd("1password"))                                                      -- default: pin window | niri: Mod+P
hl.bind("SUPER + ALT + B", hl.dsp.exec_cmd("brave-origin"))                                                    -- default: none | niri: Mod+ALT+B
hl.bind("SUPER + O", hl.dsp.exec_cmd("obsidian"))                                                       -- default: none | niri: Mod+O
hl.bind("SUPER + T", require("utils.functions").toggle("telegram"))                                       -- default: terminal (scratchpad, see bottom) | niri: Mod+T
hl.bind("SUPER + M", hl.dsp.exec_cmd("proton-mail"))                                                       -- default: music scratchpad (moved to SUPER + S) | niri: Mod+M
-- hl.bind("SUPER + A", hl.dsp.exec_cmd("kitty tmux new -A -s claude"))                                 -- default: none | niri: Mod+ALT+A
-- hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd("brave --app-id=ooigkdhpdelnhnmnknbeeajbngilljbe"))          -- default: record with sound | niri: Mod+ALT+R (Renshuu)
-- hl.bind("SUPER + ALT + G", hl.dsp.exec_cmd("brave --app-id=mjoklplbddabcmpepnokjaffbmgbkkgg"))          -- default: none | niri: Mod+ALT+G (GitHub)

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

-- Shell kill and restart: keybinds.lua runs "qs -c caelestia", which finds nothing
-- with Nixpkgs' caelestia-shell; "caelestia shell" reaches it.
hl.unbind("CTRL + SUPER + SHIFT + R")                                                                   -- default: kill the shell with qs | niri: none
hl.unbind("CTRL + SUPER + ALT + R")                                                                     -- default: restart the shell with qs | niri: none
hl.bind("CTRL + SUPER + SHIFT + R", hl.dsp.exec_cmd("caelestia shell -k"), { release = true })          -- default: kill the shell | niri: none
hl.bind("CTRL + SUPER + ALT + R", hl.dsp.exec_cmd("caelestia shell -r"), { release = true })            -- default: restart the shell | niri: none

-- Bound in keybinds.lua with no variable, unchanged:
--   SUPER + left/right/up/down          focus window in direction    -- niri: Mod+Left/Right/Up/Down
--   SUPER + left mouse button (drag)    move window                  -- niri: none (niri's built-in Mod+drag)
--   SUPER + right mouse button (drag)   resize window                -- niri: none (niri's built-in Mod+right drag)
--   XF86 volume, media, brightness keys                              -- niri: the same keys, through dms ipc
--   SUPER + ALT + F12                   test notification            -- niri: none

--[[
Missing: niri binds with no counterpart in Hyprland's dwindle layout.

  Mod+Shift+Escape       show-hotkey-overlay                no overlay; `hyprctl binds` lists binds
  Mod+BracketLeft/Right  consume-or-expel-window-left/right columns do not exist in dwindle; Caelestia's groups (SUPER + Comma) stack windows as tabs
  Mod+Home / Mod+End     focus-column-first / -last         no columns
  Mod+CTRL+Home / End    move-column-to-first / -last       no columns
  Mod+CTRL+F             expand-column-to-available-width   no columns; SUPER + F (maximised) is the nearest
  Mod+C                  center-column                      no columns; SUPER + C is Caelestia's editor key
  Mod+CTRL+C             center-visible-columns             no columns
  Mod+Escape             toggle-keyboard-shortcuts-inhibit  no dispatcher; the bind option dont_inhibit makes one bind ignore inhibitors
  recent-windows off     frees Mod+Tab                      nothing to do: SUPER + Tab is unbound

Missing: other niri settings with no counterpart in this configuration.

  input       numlock                                Caelestia: numlock_by_default = false (hyprland/input.lua)
  input       warp-mouse-to-focus mode="center-xy"   not set
  input       workspace-auto-back-and-forth          not set (binds.workspace_back_and_forth)
  input       touchpad tap, natural-scroll           natural_scroll set by Caelestia; tap-to-click not set
  layout      gaps 3                                 Caelestia: gaps_in 5, gaps_out 10, 20 with one window
  layout      column widths and centring             no columns in dwindle
  rules       named workspaces Main, Game, Chat, Misc
  rules       zen, obsidian -> Main; steam, lutris -> Game; vesktop, telegram, signal, element, fractal -> Chat; spotify -> Misc
              Caelestia puts vesktop in the communication scratchpad and Spotify in the music scratchpad instead
  rules       1Password, KeePassXC, Secrets blocked from screen capture
  rules       corner radius 20                       Caelestia: windowRounding 15
  outputs     DP-3 5120x1440@239.761 VRR; eDP-1 1920x1200@120.003 scale 1.25 at x=3840 VRR
              Caelestia: one monitor rule, preferred mode, auto position, scale 1
  misc        prefer-no-csd                          no Hyprland option
  misc        screenshot-path null                   Caelestia's screenshot tool decides
  misc        honor-xdg-activation-with-invalid-serial   was for DMS
  animations  your springs and curves                Caelestia's own (hyprland/animations.lua)
]]

-- Monitors: the G9's preferred HDMI mode is 3840x1080, so force native resolution
hl.monitor({
    output   = "HDMI-A-2",
    mode     = "5120x1440@59.98",
    position = "0x0",
    scale    = 1,
})

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
})

-- kitty asks to be maximised on launch, which breaks the tiling layout
-- hl.window_rule({ match = { class = "^kitty(-scratch)?$" }, suppress_event = "maximize" })

-- File dialogs: yazi in kitty (xdg-desktop-portal-termfilechooser), floating like Caelestia's GTK dialogs
hl.window_rule({ match = { class = "^termfilechooser$" }, tag = "+float_60_70" })

-- Screenshots: region picker straight to the clipboard instead of opening swappy
hl.bind("SUPER + SHIFT + S", hl.dsp.global("caelestia:screenshotFreezeClip"))                           -- default: same key, opens swappy | niri: Mod+Shift+S

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

-- Autostart (alongside Caelestia's own list in hyprland/execs.lua)
hl.on("hyprland.start", function()
    hl.exec_cmd("1password --silent") -- straight to tray, keeps SSH agent / browser unlock available
    hl.exec_cmd("tmux new -d -s master") -- starts the tmux server (continuum restores the rest); SUPER + Return attaches
end)

-- Telegram has its own scratchpad (SUPER + T); Vesktop keeps the communication one (SUPER + D)
hl.window_rule({ match = { class = "^org\\.telegram\\.desktop$" }, workspace = "special:telegram" })

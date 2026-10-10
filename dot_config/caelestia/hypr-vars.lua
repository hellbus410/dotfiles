-- ~/.config/caelestia/hypr-vars.lua
-- Overrides for ~/.config/hypr/variables.lua (Caelestia dots f64ad4f, 2026-10-06).
-- Every line ends with Caelestia's default and the niri bind it replaced
-- (~/.config/niri/local.d/keybinds.kdl); "none" = no such bind.
-- To take Caelestia's key instead, copy the default into the value, or delete the line.

return {
    -- Apps
    terminal                   = "kitty tmux new -A -s master",        -- default: foot | niri: foot -e tmux new -A -s main
    browser                    = "brave",                              -- default: firefox | niri: flatpak run app.zen_browser.zen; Zen is not in Nixpkgs, use the name its flake installs
    editor                     = "kitty nvim",                         -- default: codium | niri: none
    fileExplorer               = "kitty yazi",                         -- default: thunar | niri: nautilus
    audioSettings              = "pwvucontrol",                        -- default: pwvucontrol | niri: none

    -- Cursor (~/.local/share/icons/arknights, falls back to …/prts; both in chezmoi)
    cursorTheme                = "arknights",                          -- default: sweet-cursors | niri: none
    cursorSize                 = 32,                                   -- default: 24 | niri: none; the cursors are drawn at 32

    -- Misc
    volumeStep                 = 5,                                    -- default: 10 | niri: 5

    -- Workspaces by number (modifier only, the key is 1-9 and 0)
    kbGoToWs                   = "SUPER",                              -- default: SUPER | niri: Mod
    kbMoveWinToWs              = "CTRL + SUPER",                       -- default: SUPER + ALT | niri: Mod+CTRL
    kbGoToWsGroup              = "",                                   -- default: CTRL + SUPER | niri: none
    kbMoveWinToWsGroup         = "",                                   -- default: CTRL + SUPER + ALT | niri: none

    -- Workspaces
    kbNextWs                   = "SUPER + U",                          -- default: SUPER + mouse_down, CTRL + SUPER + Right, SUPER + Page_Down | niri: Mod+J, Mod+Page_Down, Mod+WheelScrollDown
    kbPrevWs                   = "SUPER + I",                          -- default: SUPER + mouse_up, CTRL + SUPER + Left, SUPER + Page_Up | niri: Mod+K, Mod+Page_Up, Mod+WheelScrollUp
    kbMoveWinToWsNext          = "CTRL + SUPER + U",                   -- default: SUPER + ALT + mouse_down, SUPER + ALT + Page_Down, CTRL + SUPER + SHIFT + Right | niri: Mod+CTRL+J, Mod+CTRL+Page_Down, Mod+CTRL+WheelScrollDown
    kbMoveWinToWsPrev          = "CTRL + SUPER + I",                   -- default: SUPER + ALT + mouse_up, SUPER + ALT + Page_Up, CTRL + SUPER + SHIFT + Left | niri: Mod+CTRL+K, Mod+CTRL+Page_Up, Mod+CTRL+WheelScrollUp
    kbNextWsGroup              = "",                                   -- default: CTRL + SUPER + mouse_down | niri: none
    kbPrevWsGroup              = "",                                   -- default: CTRL + SUPER + mouse_up | niri: none
    kbMoveWinToWsSpecial       = "SUPER + ALT + S",                    -- default: SUPER + ALT + S, CTRL + SUPER + SHIFT + Up | niri: none
    kbMoveWinFromWsSpecial     = "CTRL + SUPER + ALT + S",             -- default: CTRL + SUPER + SHIFT + Down | niri: none

    -- Window groups
    kbWindowCycleNext          = "",                                   -- default: ALT + TAB | niri: none
    kbWindowCyclePrev          = "",                                   -- default: SHIFT + ALT + TAB | niri: none
    kbWindowGroupCycleNext     = "",                                   -- default: CTRL + ALT + TAB | niri: none
    kbWindowGroupCyclePrev     = "",                                   -- default: CTRL + SHIFT + ALT + TAB | niri: none
    kbToggleGroup              = "",                                   -- default: SUPER + Comma | niri: none
    kbGroupLockActive          = "",                                   -- default: SUPER + SHIFT + Comma | niri: none
    kbUngroup                  = "",                                   -- default: SUPER + U | niri: none

    -- Window actions
    kbWindowDecreaseWidth      = "SUPER + Minus",                      -- default: SUPER + Minus, SUPER + ALT + Left | niri: Mod+Minus
    kbWindowIncreaseWidth      = "SUPER + Equal",                      -- default: SUPER + Equal, SUPER + ALT + Right | niri: Mod+Equal
    kbWindowDecreaseHeight     = "SUPER + SHIFT + Minus",              -- default: SUPER + SHIFT + Minus, SUPER + ALT + Up | niri: Mod+Shift+Minus
    kbWindowIncreaseHeight     = "SUPER + SHIFT + Equal",              -- default: SUPER + SHIFT + Equal, SUPER + ALT + Down | niri: Mod+Shift+Equal
    kbWindowFullscreen         = "SUPER + ALT + F",                    -- default: SUPER + F | niri: Mod+ALT+F
    kbWindowBorderedFullscreen = "SUPER + F",                          -- default: SUPER + ALT + F | niri: Mod+F (maximize-window-to-edges)
    kbToggleWindowFloating     = "SUPER + ALT + T",                    -- default: SUPER + ALT + Space | niri: Mod+ALT+T (SUPER + T is Telegram)
    kbCloseWindow              = "SUPER + Q",                          -- default: SUPER + Q | niri: Mod+Q
    kbMoveWindow               = "SUPER + Z",                          -- default: SUPER + Z | niri: none
    kbResizeWindow             = "SUPER + X",                          -- default: SUPER + X | niri: none
    kbCenterWindow             = "CTRL + SUPER + Backslash",           -- default: CTRL + SUPER + Backslash | niri: none (Mod+C centred a column, not a floating window)
    kbNormalizeWindow          = "CTRL + SUPER + ALT + Backslash",     -- default: CTRL + SUPER + ALT + Backslash | niri: none
    kbWindowPip                = "SUPER + ALT + Backslash",            -- default: SUPER + ALT + Backslash | niri: none
    kbPinWindow                = "SUPER + ALT + P",                    -- default: SUPER + P | niri: none

    -- Special workspaces (scratchpads)
    kbSystemMonitorWs          = "CTRL + SHIFT + Escape",              -- default: CTRL + SHIFT + Escape | niri: CTRL+Shift+Escape opened btop in a new foot window
    kbCommunicationWs          = "SUPER + D",                          -- default: SUPER + D | niri: Mod+D opened Vesktop
    kbMusicWs                  = "SUPER + S",                          -- default: SUPER + M | niri: Mod+S opened Spotify
    kbSpecialWs                = "SUPER + grave",                      -- default: SUPER + S | niri: none
    kbTodoWs                   = "",                                   -- default: SUPER + R | niri: none; Todoist is disabled in cli.json

    -- Apps
    kbTerminal                 = "SUPER + Return",                     -- default: SUPER + T | niri: Mod+Return
    kbBrowser                  = "SUPER + B",                          -- default: SUPER + W | niri: Mod+B
    kbFileExplorer             = "SUPER + E",                          -- default: SUPER + E | niri: Mod+E
    kbEditor                   = "SUPER + C",                          -- default: SUPER + C | niri: none (Mod+C was center-column)
    kbAudioSettings            = "CTRL + ALT + V",                     -- default: CTRL + ALT + V | niri: none

    -- Utilities
    kbScreenshotFreeze         = "",                                   -- default: SUPER + SHIFT + S (opens swappy) | niri: Mod+Shift+S; rebound to clipboard in hypr-user.lua
    kbScreenshot               = "",                                   -- default: Print | niri: none
    kbScreenshotRegion         = "",                                   -- default: SUPER + SHIFT + ALT + S | niri: none
    kbRecord                   = "",                                   -- default: CTRL + ALT + R | niri: none
    kbRecordSound              = "",                                   -- default: SUPER + ALT + R | niri: none (Mod+ALT+R was Renshuu)
    kbRecordRegion             = "",                                   -- default: SUPER + SHIFT + ALT + R | niri: none
    kbColorPicker              = "",                                   -- default: SUPER + SHIFT + C | niri: none

    -- Media (the XF86 media keys are bound in keybinds.lua, as niri had them)
    kbMediaToggle              = "",                                   -- default: CTRL + SUPER + Space | niri: none
    kbMediaNext                = "",                                   -- default: CTRL + SUPER + Equal | niri: none
    kbMediaPrev                = "",                                   -- default: CTRL + SUPER + Minus | niri: none
    kbMediaStop                = "",                                   -- default: CTRL + SUPER + Backspace | niri: none
    kbVolumeMute               = "",                                   -- default: SUPER + SHIFT + M | niri: none

    -- Shell
    kbLauncher                 = "SUPER + SUPER_L",                    -- default: SUPER + SUPER_L (Super pressed and released alone) | niri: ALT+Space
    kbSession                  = "SUPER + SHIFT + Q",                  -- default: CTRL + ALT + Delete | niri: Mod+Shift+Q
    kbLock                     = "SUPER + ALT + L",                    -- default: SUPER + L | niri: Mod+ALT+L
    kbShowSidebar              = "SUPER + N",                          -- default: SUPER + N | niri: none
    kbClearNotifs              = "",                                   -- default: CTRL + ALT + C | niri: none
    kbShowPanels               = "",                                   -- default: SUPER + K | niri: none
    kbRestoreLock              = "CTRL + SUPER + ALT + L",             -- default: SUPER + ALT + L | niri: none
    kbSleep                    = "",                                   -- default: SUPER + SHIFT + L | niri: none

    -- Clipboard and emoji
    kbClipboard                = "SUPER + V",                          -- default: SUPER + V | niri: Mod+V
    kbClipboardDel             = "SUPER + ALT + V",                    -- default: SUPER + ALT + V | niri: none
    kbClipboardPasteLatest     = "",                                   -- default: CTRL + SHIFT + ALT + V | niri: none
    kbEmoji                    = "SUPER + Period",                     -- default: SUPER + Period | niri: none
}

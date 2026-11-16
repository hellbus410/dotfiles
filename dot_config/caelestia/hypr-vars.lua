-- Overrides for ~/.config/hypr/variables.lua
-- To take Caelestia's key instead, copy the default into the value, or delete the line.

return {
    -- Apps
    terminal                   = "foot -e tmux new -A -s master",
    browser                    = "zen-beta",
    editor                     = "foot -e nvim",
    fileExplorer               = "foot -e yazi",
    audioSettings              = "pwvucontrol",

    -- Cursor (~/.local/share/icons/arknights, falls back to …/prts; both in chezmoi)
    cursorTheme                = "arknights",
    cursorSize                 = 48,

    -- Misc
    volumeStep                 = 5,

    -- Window styling: no global transparency (it applied to games too); foot sets its own alpha in foot.ini
    windowOpacity              = 1,

    -- Gaps (niri: gaps 3)
    windowGapsIn               = 2,
    windowGapsOut              = 4,
    singleWindowGapsOut        = 4,

    -- Workspaces by number (modifier only, the key is 1-9 and 0)
    kbGoToWs                   = "SUPER",
    kbMoveWinToWs              = "CTRL + SUPER",
    kbGoToWsGroup              = "",
    kbMoveWinToWsGroup         = "",

    -- Workspaces
    kbNextWs                   = "SUPER + U",
    kbPrevWs                   = "SUPER + I",
    kbMoveWinToWsNext          = "CTRL + SUPER + U",
    kbMoveWinToWsPrev          = "CTRL + SUPER + I",
    kbNextWsGroup              = "",
    kbPrevWsGroup              = "",
    kbMoveWinToWsSpecial       = "",
    kbMoveWinFromWsSpecial     = "",

    -- Window groups
    kbWindowCycleNext          = "",
    kbWindowCyclePrev          = "",
    kbWindowGroupCycleNext     = "",
    kbWindowGroupCyclePrev     = "",
    kbToggleGroup              = "",
    kbGroupLockActive          = "",
    kbUngroup                  = "",

    -- Window actions
    kbWindowDecreaseWidth      = "SUPER + Minus",
    kbWindowIncreaseWidth      = "SUPER + Equal",
    kbWindowDecreaseHeight     = "SUPER + SHIFT + Minus",
    kbWindowIncreaseHeight     = "SUPER + SHIFT + Equal",
    kbWindowFullscreen         = "SUPER + ALT + F",
    kbWindowBorderedFullscreen = "SUPER + F",
    kbToggleWindowFloating     = "SUPER + SHIFT + T",
    kbCloseWindow              = "SUPER + Q",
    kbMoveWindow               = "SUPER + Z",
    kbResizeWindow             = "SUPER + X",
    kbCenterWindow             = "CTRL + SUPER + Backslash",
    kbNormalizeWindow          = "CTRL + SUPER + ALT + Backslash",
    kbWindowPip                = "SUPER + ALT + Backslash",
    kbPinWindow                = "SUPER + ALT + P",

    -- Special workspaces (scratchpads)
    kbSystemMonitorWs          = "CTRL + SHIFT + Escape",
    kbCommunicationWs          = "SUPER + D",
    kbMusicWs                  = "SUPER + ALT + M",
    kbSpecialWs                = "SUPER + S",
    kbTodoWs                   = "",

    -- Apps
    kbTerminal                 = "SUPER + Return",
    kbBrowser                  = "SUPER + B",
    kbFileExplorer             = "SUPER + E",
    kbEditor                   = "SUPER + C",
    kbAudioSettings            = "CTRL + ALT + V",

    -- Utilities
    kbScreenshotFreeze         = "",
    kbScreenshot               = "",
    kbScreenshotRegion         = "",
    kbRecord                   = "",
    kbRecordSound              = "",
    kbRecordRegion             = "",
    kbColorPicker              = "",

    -- Media (the XF86 media keys are bound in keybinds.lua, as niri had them)
    kbMediaToggle              = "",
    kbMediaNext                = "",
    kbMediaPrev                = "",
    kbMediaStop                = "",
    kbVolumeMute               = "",

    -- Shell
    kbLauncher                 = "SUPER + SUPER_L",
    kbSession                  = "SUPER + SHIFT + Q",
    kbLock                     = "SUPER + ALT + L",
    kbShowSidebar              = "SUPER + N",
    kbClearNotifs              = "SUPER + ALT + N",
    kbShowPanels               = "",
    kbRestoreLock              = "CTRL + SUPER + ALT + L",
    kbSleep                    = "",

    -- Clipboard and emoji
    kbClipboard                = "SUPER + V",
    kbClipboardDel             = "SUPER + ALT + V",
    kbClipboardPasteLatest     = "",
    kbEmoji                    = "SUPER + SHIFT + V",
}

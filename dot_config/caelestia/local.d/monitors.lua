-- Monitors: Samsung Odyssey G9 (5120x1440 native).
-- Scoped exclusively to the G9 by description so other displays keep their native resolution.
-- 60Hz over HDMI (hardware limit), 240Hz over DisplayPort.
hl.monitor({
    output   = "desc:Samsung Electric Company LS49AG95 HNTRA00181",
    mode     = "5120x1440@59.98",
    position = "0x0",
    scale    = 1,
})

local function configure_g9()
    for _, mon in ipairs(hl.get_monitors({ all = true })) do
        if mon.description and mon.description:find("LS49AG95", 1, true) then
            local hz = mon.name:find("^HDMI") and "59.98" or "239.76"
            hl.monitor({
                output   = "desc:" .. mon.description,
                mode     = "5120x1440@" .. hz,
                position = "0x0",
                scale    = 1,
            })
        end
    end
end

configure_g9()
hl.on("monitor.added", configure_g9)


local wibox = require("wibox")
local vicious = require("vicious")

function os.capture(cmd, raw)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()
    if raw then return s end
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')
    return s
end

local function get_updates(format, warg)
    local _checkupgrade = {}
    _checkupgrade.pacman = os.capture('pacman -Qqu | wc -l')
    _checkupgrade.aur = os.capture('cower -u | wc -l')

    return {_checkupgrade.pacman, _checkupgrade.aur}
end

checkupgradewidget = wibox.widget.textbox()
vicious.register(checkupgradewidget, get_updates, "pacman: $1 AUR: $2 ", 60)
return checkupgradewidget

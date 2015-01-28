local wibox = require("wibox")
local vicious = require("vicious")
memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem, "MEM: $1% ($2MB/$3MB)", 13)
return memwidget

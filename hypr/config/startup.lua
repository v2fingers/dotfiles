local settings = require("config.settings")

-- Clipboard history
hl.exec_cmd("wl-paste --type text --watch cliphist store")
hl.exec_cmd("wl-paste --type image --watch cliphist store")

-- Autostart
hl.on("hyprland.start", function()
	-- hl.exec_cmd(settings.terminal)
	hl.exec_cmd("waybar & hyprpaper")
end)

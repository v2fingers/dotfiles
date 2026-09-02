local settings = require("config.settings")

local mainMod = settings.mainMod
local terminal = settings.terminal
local fileManager = settings.fileManager
local menu = settings.menu

-- KEYBINDINGS

-- Clipboard history
hl.bind(
	mainMod .. " + F",
	hl.dsp.exec_cmd(
		"cliphist list | rofi -dmenu -p 'Clipboard' | cliphist decode | wl-copy"
	)
)

-- Screenshot
hl.bind(
	"PRINT",
	hl.dsp.exec_cmd(
		"file=\"$HOME/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png\"; grim -g \"$(slurp)\" \"$file\" && wl-copy < \"$file\""
	)
)

-- Window controls
local closeWindowBind = hl.bind(
	mainMod .. " + C",
	hl.dsp.window.close()
)

hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd(
		"command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
	)
)

-- Applications
hl.bind(
	mainMod .. " + Q",
	hl.dsp.exec_cmd(terminal)
)

hl.bind(
	mainMod .. " + E",
	hl.dsp.exec_cmd(fileManager)
)

hl.bind(
	mainMod .. " + R",
	hl.dsp.exec_cmd(menu)
)

-- Window state
hl.bind(
	mainMod .. " + V",
	hl.dsp.window.float({
		action = "toggle",
	})
)

hl.bind(
	mainMod .. " + P",
	hl.dsp.window.pseudo()
)

hl.bind(
	mainMod .. " + J",
	hl.dsp.layout("togglesplit")
)

-- Focus
hl.bind(
	mainMod .. " + left",
	hl.dsp.focus({
		direction = "left",
	})
)

hl.bind(
	mainMod .. " + right",
	hl.dsp.focus({
		direction = "right",
	})
)

hl.bind(
	mainMod .. " + up",
	hl.dsp.focus({
		direction = "up",
	})
)

hl.bind(
	mainMod .. " + down",
	hl.dsp.focus({
		direction = "down",
	})
)

-- Workspaces
for i = 1, 10 do
	local key = i % 10

	hl.bind(
		mainMod .. " + " .. key,
		hl.dsp.focus({
			workspace = i,
		})
	)

	hl.bind(
		mainMod .. " + SHIFT + " .. key,
		hl.dsp.window.move({
			workspace = i,
		})
	)
end

-- Mouse
hl.bind(
	mainMod .. "+ mouse:272",
	hl.dsp.window.drag(),
	{
		mouse = true,
	}
)

hl.bind(
	mainMod .. "+ SHIFT + mouse:272",
	hl.dsp.window.resize(),
	{
		mouse = true,
	}
)

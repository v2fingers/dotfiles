-- LOOK AND FEEL

hl.config({
	general = {
		gaps_in          = 2,
		gaps_out         = 5,
		border_size      = 2,
		col              = {
			active_border   = "#adadad",
			inactive_border = "#404040",
		},
		resize_on_border = false,
		allow_tearing    = false,
		layout           = "dwindle",
	},
	decoration = {
		rounding = 5,
		active_opacity = 1,
		inactive_opacity = .98,
	},
	animations = {
		enabled = true,
	},

})

-- ENVIRONMENT VARIABLES
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- CURVES

hl.curve("smoothOut", {
	type = "bezier",
	points = {
		{ 0.25, 0.9 },
		{ 0.35, 1.0 },
	},
})

hl.curve("smoothInOut", {
	type = "bezier",
	points = {
		{ 0.4, 0.0 },
		{ 0.2, 1.0 },
	},
})

hl.curve("subtle", {
	type = "bezier",
	points = {
		{ 0.22, 0.9 },
		{ 0.3,  1.0 },
	},
})

hl.curve("stylish", {
	type = "bezier",
	points = {
		{ 0.2,  1.0 },
		{ 0.15, 1.0 },
	},
})

-- ANIMATIONS

hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 6,
	bezier = "stylish",
	style = "popin 96%",
})

hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 5,
	bezier = "smoothInOut",
	style = "popin 96%",
})

hl.animation({
	leaf = "border",
	enabled = true,
	speed = 9,
	bezier = "subtle",
})

hl.animation({
	leaf = "fade",
	enabled = true,
	speed = 5,
	bezier = "smoothInOut",
})

hl.animation({
	leaf = "layersIn",
	enabled = true,
	speed = 5,
	bezier = "subtle",
	style = "slide bottom",
})

hl.animation({
	leaf = "layersOut",
	enabled = true,
	speed = 4,
	bezier = "smoothInOut",
	style = "slide bottom",
})

hl.animation({
	leaf = "fadeLayersIn",
	enabled = true,
	speed = 4,
	bezier = "subtle",
})

hl.animation({
	leaf = "fadeLayersOut",
	enabled = true,
	speed = 4,
	bezier = "smoothInOut",
})

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 4,
	bezier = "stylish",
	style = "slide",
})

-- LAYOUTS

hl.config({
	dwindle = {
		preserve_split = true,
	},
})

hl.config({
	master = {
		new_status = "master",
	},
})

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

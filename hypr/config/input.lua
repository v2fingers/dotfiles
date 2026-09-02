-- INPUT

hl.config({
	input = {
		kb_layout    = "us",
		-- kb_variant   = "colemak_dh",
		kb_model     = "",
		kb_options   = "",
		kb_rules     = "",

		follow_mouse = 1,

		sensitivity  = 0,

		touchpad     = {
			natural_scroll = true,
		},
	},
})

-- GESTURES

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

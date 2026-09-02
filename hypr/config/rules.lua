--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Window rules

local suppressMaximizeRule = hl.window_rule({
	name = "suppress-maximize-events",

	match = {
		class = ".*",
	},

	suppress_event = "maximize",
})

-- Uncomment this if you want to disable the rule:
-- suppressMaximizeRule:set_enabled(false)


-- Fix XWayland dragging issues

hl.window_rule({
	name = "fix-xwayland-drags",

	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})


-- Hyprland-run window rule

hl.window_rule({
	name = "move-hyprland-run",

	match = {
		class = "hyprland-run",
	},

	move = "20 monitor_h-120",
	float = true,
})


-- OPTIONAL: Smart gaps
--
-- Uncomment these if you want no gaps when only one window is open.

-- hl.workspace_rule({
--     workspace = "w[tv1]",
--     gaps_out = 0,
--     gaps_in = 0,
-- })

-- hl.workspace_rule({
--     workspace = "f[1]",
--     gaps_out = 0,
--     gaps_in = 0,
-- })

-- hl.window_rule({
--     name = "no-gaps-wtv1",
--     match = {
--         float = false,
--         workspace = "w[tv1]",
--     },
--     border_size = 0,
--     rounding = 0,
-- })

-- hl.window_rule({
--     name = "no-gaps-f1",
--     match = {
--         float = false,
--         workspace = "f[1]",
--     },
--     border_size = 0,
--     rounding = 0,
-- })

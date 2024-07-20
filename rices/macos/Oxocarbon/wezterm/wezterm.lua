local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

-- change this to your monitor's DPI or remove it
config.dpi = 227

config.font_size = 10.0
config.bold_brightens_ansi_colors = true
config.harfbuzz_features = { "calt=0" }
config.font = wezterm.font_with_fallback({
	"Hack Nerd Font",
	"Fira Code",
	"Jetbrains Mono",
})

-- change the opacity and blur to your liking
-- (opacity has to be less than 1 for blur to work)
config.window_background_opacity = 1.00
config.macos_window_background_blur = 0

-- use one of the built-in color schemes
-- or import your own (then using the name found in the [metadata] section)
config.color_scheme = "Oxocarbon Dark"

config.window_padding = {
	left = 0,
	right = 0,
	top = 7,
	bottom = 0,
}

config.keys = {
	-- activate pane selection mode with numeric labels
	{
		key = "b",
		mods = "SHIFT|CTRL",
		action = act.PaneSelect({
			alphabet = "1234567890",
		}),
	},
}

config.tab_bar_at_bottom = true

-- removes native title bar
config.window_decorations = "RESIZE"

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

return config

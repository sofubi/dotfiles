local wezterm = require("wezterm")
local gpu_adapters = require("utils.gpu_adapter")
local platform = require("utils.platform")()
local colors = require("colors.custom")

local macos_blur = platform.is_mac and 30 or nil

return {
	animation_fps = 60,
	max_fps = 60,
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",
	webgpu_preferred_adapter = gpu_adapters:pick_best(),

	-- color scheme
	color_scheme = "Catppuccin Mocha",

	-- background
	macos_window_background_blur = macos_blur,
	background = {
		{
			source = { File = wezterm.GLOBAL.background },
			horizontal_align = "Center",
			height = "Contain",
		},
		{
			source = { Color = colors.background },
			height = "100%",
			width = "100%",
			opacity = 0.95,
		},
	},

	-- tab bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = false,
	use_fancy_tab_bar = false,
	tab_max_width = 25,
	show_tab_index_in_tab_bar = false,
	switch_to_last_active_tab_when_closing_tab = true,

	-- window
	window_padding = {
		left = 5,
		right = 10,
		top = 12,
		bottom = 7,
	},
	window_close_confirmation = "NeverPrompt",
	window_frame = {
		active_titlebar_bg = "#090909",
		-- font = fonts.font,
		-- font_size = fonts.font_size,
	},
	inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.65,
	},
}

local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Appearance
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
config.font_size = 13

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "zenbones_dark"
	else
		return "zenbones"
	end
end

local function background(scheme)
	return {
		{
			source = { File = "/Users/sofubi/.config/wezterm/backgrounds/giants_causeway.jpg" },
			horizontal_align = "Center",
			height = "Contain",
		},
		{
			source = { Color = wezterm.get_builtin_color_schemes()[scheme].background },
			height = "100%",
			width = "100%",
			opacity = 0.93,
		},
	}
end

wezterm.on("window-config-reloaded", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local scheme = scheme_for_appearance(appearance)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		overrides.background = background(scheme)
		window:set_config_overrides(overrides)
	end
end)

-- Panes
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}

-- Tabs
config.use_fancy_tab_bar = false

-- Keys
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true

local act = wezterm.action
config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "\\",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{ key = "LeftArrow", mods = "CMD", action = act.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "CMD", action = act.ActivateTabRelative(1) },
	{
		key = "LeftArrow",
		mods = "CMD|SHIFT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CMD|SHIFT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CMD|SHIFT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CMD|SHIFT",
		action = act.ActivatePaneDirection("Down"),
	},
	{ key = "X", mods = "CTRL", action = wezterm.action.ActivateCopyMode },
	{
		key = "C",
		mods = "CTRL",
		action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
	},
	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "=", mods = "CMD", action = wezterm.action.IncreaseFontSize },
	{ key = "-", mods = "CMD", action = wezterm.action.DecreaseFontSize },
	{ key = "0", mods = "CMD", action = wezterm.action.ResetFontSize },
	{
		key = "Z",
		mods = "CMD",
		action = wezterm.action.TogglePaneZoomState,
	},
}

return config

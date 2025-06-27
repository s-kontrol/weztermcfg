-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
config.font = wezterm.font("Cascadia Code", { weight = "Regular" })
config.color_scheme = "Campbell"
config.font_size = 11.5
config.freetype_load_target = "Light" -- improves clarity
config.freetype_render_target = "Normal"
config.colors = {
	background = "#1f1f1f",
	foreground = "#e5e5e5",
	ansi = {
		"#0c0c0c",
		"#d80000",
		"#13a10e",
		"#c19c00",
		"#0037da",
		"#881798",
		"#3a96dd",
		"#cccccc",
	},
	brights = {
		"#767676",
		"#ff4b4b",
		"#16c60c",
		"#f9f1a5",
		"#3b78ff",
		"#b4009e",
		"#61d6d6",
		"#ffffff",
	},
}
config.window_background_opacity = 1.0 -- 1.0 = opaque, 0.0 = fully transparent

config.enable_tab_bar = true
if wezterm.target_triple:find("windows") then
	config.default_prog = { "pwsh.exe" }
end

config.window_padding = {
	left = 8,
	right = 8,
	top = 4,
	bottom = 4,
}
config.scrollback_lines = 5000
config.audible_bell = "Disabled"

config.keys = {
	{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "1", mods = "CTRL", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "F4", mods = "CTRL", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
}

-- and finally, return the configuration to wezterm
return config

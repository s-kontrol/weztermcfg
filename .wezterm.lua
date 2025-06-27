-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Campbell"
config.window_background_opacity = 0.97 -- 1.0 = opaque, 0.0 = fully transparent

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
}

-- and finally, return the configuration to wezterm
return config

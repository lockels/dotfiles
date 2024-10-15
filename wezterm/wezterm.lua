local wezterm = require("wezterm")

Config = wezterm.config_builder()

Config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	color_scheme = "rose-pine",
	font_size = 15.0,
	window_background_opacity = 0.64,
	send_composed_key_when_left_alt_is_pressed = true,
	send_composed_key_when_right_alt_is_pressed = false,
}

return Config

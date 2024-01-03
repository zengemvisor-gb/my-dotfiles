-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
--config.color_scheme = 'Tinacious Design (Dark)'
config.color_scheme = "Kanagawa (Gogh)"
--config.color_scheme = 'Tokyo Night Storm'
config.hide_tab_bar_if_only_one_tab = true
--config.font = wezterm.font("Jetbrains Mono NerdFont")
--config.font = wezterm.font 'Cascadia Cove NerdFont'
--config.font = wezterm.font 'Go Mono NerdFont'
config.font = wezterm.font("JetBrainsMono Nerd Font")
--config.font = wezterm.font("IosevkaTerm Nerd Font")
--config.font = wezterm.font("Iosevka Nerd Font")
-- and finally, return the configuration to wezterm
return config

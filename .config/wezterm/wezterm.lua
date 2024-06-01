local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("CommitMono Nerd Font")
config.font_size = 11.0
config.color_scheme = "catppuccin-mocha"  

config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.initial_cols = 148
config.initial_rows = 52

config.window_background_opacity = 0.97
config.front_end = "WebGpu"

return config

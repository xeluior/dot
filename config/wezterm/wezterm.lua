local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'tokyonight_night'
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.95
config.hide_mouse_cursor_when_typing = true
config.font = wezterm.font {
  family = 'IosevkaTermNerdFontMono',
  harfbuzz_features = { 'calt=0' }
}

return config

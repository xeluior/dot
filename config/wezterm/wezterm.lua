local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font 'IosevkaTermNerdFontMono'
config.default_prog = {'/usr/bin/bash'}
config.color_scheme = 'Aci (Gogh)'
config.window_background_opacity = 0.9
config.hide_tab_bar_if_only_one_tab = true
config.pane_focus_follows_mouse = true
config.term = 'wezterm'

return config

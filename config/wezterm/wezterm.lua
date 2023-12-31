local wezterm = require 'wezterm'
local color_scheme = 'Aci (Gogh)'
local colors = wezterm.color.get_builtin_schemes()[color_scheme]
local ground_colors = { bg_color = colors.background, fg_color = colors.foreground }
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font {
  family = 'IosevkaTermNerdFontMono',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' } 
}
config.default_prog = {'/usr/bin/bash'}
config.color_scheme = color_scheme
config.window_background_opacity = 0.9
config.hide_tab_bar_if_only_one_tab = true
config.pane_focus_follows_mouse = true
config.use_fancy_tab_bar = false
config.term = 'wezterm'
config.audible_bell = 'Disabled'
config.colors = {
  tab_bar = {
    background = colors.background,
    active_tab = {
      bg_color = colors.background,
      fg_color = colors.foreground,
      intensity = 'Bold'
    },
    inactive_tab = ground_colors,
    inactive_tab_hover = ground_colors,
    new_tab_hover = ground_colors,
    new_tab = {
      bg_color = colors.background,
      fg_color = colors.foreground,
      intensity = 'Half'
    }
  }
}

return config

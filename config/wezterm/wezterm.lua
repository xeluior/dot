local wezterm = require 'wezterm'
local config = {}

function wezterminfo()
  terminfodirs = os.getenv("TERMINFO") .. ":" .. os.getenv("TERMINFO_DIRS")
  for d in string.gmatch(terminfodirs, "([^:]+)") do
    res = io.open(d .. "/w/wezterm")
    if res ~= nil then
      return "wezterm"
    end
  end
  return "xterm-256color"
end

config.color_scheme = 'tokyonight_night'
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.95
config.hide_mouse_cursor_when_typing = false
config.font = wezterm.font {
  family = 'IosevkaTermNerdFontMono',
  harfbuzz_features = { 'calt=0' }
}
config.term = wezterminfo()

return config

local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.colors = {
  foreground = '#f7f7f7',
  background = '#1c1714',

  cursor_bg = '#f7f7f7',
  cursor_fg = '#101010',
  cursor_border = "#f7f7f7",

  selection_fg = '#f7f7f7',
  selection_bg = '#101010',

  ansi = {
    '#1a1a1a',
    '#ff909d',
    '#d3ffdb',
    '#fdffd1',
    '#a3b7ff',
    '#d19cff',
    '#b2ffff',
    '#f7f7f7',
  },

  brights = {
    "#313131",
    "#ff4353",
    "#89ffcb",
    "#fdd6b6",
    "#a3b7ff",
    "#ffb1f5",
    "#b2ffff",
    "#ffffff",
  },
}

config.font = wezterm.font_with_fallback {
  'Berkeley Mono',
  'Hack Nerd Font',
}

config.font_size = 11.0
config.enable_tab_bar = false
config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 5,
}

return config

local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.colors = {
  foreground = '#f7f7f7',
  background = '#0d0d0d',

  cursor_bg = '#f7f7f7',
  cursor_fg = '#0d0d0d',
  cursor_border = "#f7f7f7",

  selection_fg = '#161616',
  selection_bg = '#0d0d0d',

  ansi = {
    '#1a1a1a',
    '#ff4353',
    '#89ffcb',
    '#fbfbcf',
    '#ab9bff',
    '#d7afff',
    '#bcffff',
    '#f7f7f7',
  },

  brights = {
    '#161616',
    '#ff7984',
    '#d3ffdb',
    '#fffff6',
    '#b7beff',
    '#ddc9ff',
    '#ebffff',
    '#ffffff',
  },
}

config.font = wezterm.font_with_fallback {
  'Berkeley Mono',
  'Hack Nerd Font',
}

config.font_size = 14.0
config.enable_tab_bar = false
config.window_padding = {
  left = 12,
  right = 12,
  top = 12,
  bottom = 12,
}

return config

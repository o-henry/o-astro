local wezterm = require "wezterm"
local config = wezterm.config_builder()

config.font = wezterm.font "JetBrainsMono Nerd Font"
config.font_size = 14
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.72
config.macos_window_background_blur = 30

config.background = {
  {
    source = { File = os.getenv "HOME" .. "/Pictures/astronvim-wallpaper.jpg" },
    horizontal_align = "Center",
    repeat_x = "NoRepeat",
    repeat_y = "NoRepeat",
    vertical_align = "Middle",
    width = "Cover",
    height = "Cover",
    hsb = {
      brightness = 0.08,
      hue = 1.0,
      saturation = 1.0,
    },
    opacity = 0.18,
  },
  {
    source = { Color = "#0f1115" },
    opacity = 0.72,
  },
}

return config

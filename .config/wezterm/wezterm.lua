local wezterm = require 'wezterm'
local config = {}

-- Tokyo Night theme definition
config.color_schemes = {
    ["TokyoNight"] = {
        background = "#1A1B2C",
        foreground = "#A9B1DC",
        cursor_bg = "#C0CAF5",
        cursor_border = "#C0CAF5",
        cursor_fg = "#1A1B2C", -- Same as background
        selection_bg = "#28344A",
        selection_fg = "#C0CAF5",
        ansi = {
            "#414868", -- Black
            "#F7768E", -- Red
            "#73DACA", -- Green
            "#E0AF68", -- Yellow
            "#7AA2F7", -- Blue
            "#BB9AF7", -- Purple
            "#7DCFFF", -- Cyan
            "#C0CAF5", -- White
        },
        brights = {
            "#414868", -- Bright Black
            "#F7768E", -- Bright Red
            "#73DACA", -- Bright Green
            "#E0AF68", -- Bright Yellow
            "#7AA2F7", -- Bright Blue
            "#BB9AF7", -- Bright Purple
            "#7DCFFF", -- Bright Cyan
            "#C0CAF5", -- Bright White
        }
    }
}

-- Apply the theme
config.color_scheme = "TokyoNight"

-- Window configuration
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.font = wezterm.font('JetBrains Mono NL', { weight = 'DemiBold' })
config.font_size = 13.0
config.line_height = 1
config.bold_brightens_ansi_colors = true
config.initial_rows = 30
config.initial_cols = 120
config.default_domain = 'WSL:Ubuntu-24.04'
config.window_frame = {
    font = wezterm.font { family = 'Roboto', weight = 'Bold' },
    font_size = 14.0,
}

-- Tab title formatting
wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab.active_pane.title
    local background_color = "#414868" -- Default grey for inactive tabs
    local text_color = "#C0CAF5" -- Default text color
    if tab.is_active then
      background_color = "#1A1B2C" -- Active tab background color
      text_color = "#C0CAF5" -- Active tab text color
    elseif hover then
      background_color = "#3b3052" -- Hover background color for inactive tabs
      text_color = "#909090" -- Hover text color for inactive tabs
    end
    local padding = 2 -- Adjust padding as needed
    local padded_title = wezterm.truncate_right(title, 50 - padding * 2)
    local title_with_padding = padded_title .. string.rep(" ", padding)
    
    return {
        { Background = { Color = background_color } },
        { Foreground = { Color = text_color } },
        { Text = title_with_padding },
    }
  end
)

return config
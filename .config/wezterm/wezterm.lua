local wezterm = require 'wezterm'
local mux = wezterm.mux
local config = wezterm.config_builder()

-- Window
config.color_scheme = 'Catppuccin Mocha'
local background_color = '#1e1e2e'
config.window_decorations = 'RESIZE'
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- Font
config.font = wezterm.font({ family = 'SpaceMono Nerd Font' })
config.font_size = 20
config.line_height = 0.8

-- Tab bar
config.enable_tab_bar = false
config.window_frame = {
  font_size = 12,
  active_titlebar_bg = background_color,
  inactive_titlebar_bg = background_color,
}

-- Individual tabs
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab_title(tab)
    if tab.is_active then
      return {
        { Background = { Color = background_color } },
        { Text = ' ' .. title .. ' ' },
      }
    else
      return {
        { Background = { Color = background_color } },
        { Text = ' ' .. title .. ' ' },
      }
    end
    return title
  end
)

return config

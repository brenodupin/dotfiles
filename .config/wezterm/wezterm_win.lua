local wezterm = require 'wezterm'

-- Read and load the WSL config file
local success, stdout, stderr  = wezterm.run_child_process({
  'wsl', '-d', 'Ubuntu-24.04', 'cat', '~/.config/wezterm/wezterm.lua'
})

if success then
  local config_fn, err = load(stdout)
  if config_fn then
    return config_fn()
  end
  wezterm.log_error("Failed to load WSL twos config: " .. (err or "unknown error"))
end

-- Fallback configuration if reading the WSL config fails
return {}
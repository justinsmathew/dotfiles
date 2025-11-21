local wezterm = require("wezterm")
local config = {}

-- Use config_builder for clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Font configuration
config.font_size = 24.0

return config

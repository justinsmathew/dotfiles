local wezterm = require("wezterm")
local config = {}

-- Set PowerShell as the default shell
config.default_prog = { "pwsh.exe" }

config.keys = {
  {key="Enter", mods="SHIFT", action=wezterm.action{SendString="\x1b\r"}},
}

return config

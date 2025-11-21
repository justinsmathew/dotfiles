# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a macOS dotfiles configuration repository located at `~/.config`. It contains configurations for a tiling window manager workflow using AeroSpace, along with terminal, editor, and UI customizations.

## Key Components

### AeroSpace Window Manager (`aerospace/`)
- **Configuration**: `aerospace/aerospace.toml`
- Tiling window manager for macOS with i3/Sway-like keybindings
- Uses vim-style navigation (Alt+h/j/k/l for focus, Alt+Shift+h/j/k/l for moving windows)
- 9 workspaces with automatic app placement rules:
  - Workspace 1: WezTerm
  - Workspace 2: Zen Browser
  - Workspace 3: Discord
  - Workspace 5: Spotify
- Integrates with JankyBorders for window borders and SketchyBar for workspace indicators
- Configuration changes: Edit `aerospace.toml`, then Alt+Shift+; → r to reload

### SketchyBar Status Bar (`sketchybar/`)
- **Main config**: `sketchybar/sketchybarrc`
- **Plugins**: `sketchybar/plugins/*.sh`
- **Colors**: `sketchybar/colors.sh` (Catppuccin Mocha theme)
- Displays workspace indicators (1-9) that sync with AeroSpace
- System stats: CPU, memory, battery, clock
- Reload: `brew services restart sketchybar`

### Neovim (`nvim/`)
- LazyVim distribution
- **Entry point**: `nvim/init.lua` → loads `nvim/lua/config/lazy.lua`
- **Configuration structure**:
  - `nvim/lua/config/` - Core config (options, keymaps, autocmds)
  - `nvim/lua/plugins/` - Custom plugin specs (currently contains example.lua which is disabled)
- Plugin management via lazy.nvim
- Custom plugins auto-loaded from `nvim/lua/plugins/`
- Refer to LazyVim documentation for defaults

### WezTerm (`wezterm/`)
- **Configuration**: `wezterm/wezterm.lua`
- Minimal configuration with 24pt font size

### Karabiner-Elements (`karabiner/`)
- **Configuration**: `karabiner/karabiner.json`
- Caps Lock remapped to:
  - Hyper key (Shift+Ctrl+Alt+Cmd) when held
  - Escape when tapped
- Contains Hyper key sublayers for custom shortcuts

## Configuration Workflow

### Editing Aerospace Configuration
1. Edit `~/.config/aerospace/aerospace.toml`
2. Reload: Alt+Shift+; then 'r' (or restart AeroSpace)

### Editing SketchyBar
1. Edit `~/.config/sketchybar/sketchybarrc` or plugin scripts
2. Reload: `brew services restart sketchybar`

### Editing Neovim Configuration
1. Edit files in `~/.config/nvim/lua/config/` or `~/.config/nvim/lua/plugins/`
2. Changes auto-reload or restart Neovim

### Editing Karabiner
1. Edit `~/.config/karabiner/karabiner.json`
2. Karabiner auto-reloads on file changes

## Integration Points

- **AeroSpace ↔ SketchyBar**: AeroSpace triggers `aerospace_workspace_change` event on workspace switches, which updates SketchyBar workspace indicators
- **AeroSpace ↔ JankyBorders**: Borders launched via `after-startup-command` in aerospace.toml
- **Karabiner Hyper Key**: Can be used to create global shortcuts that don't conflict with app-specific keybindings

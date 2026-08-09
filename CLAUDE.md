# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a macOS dotfiles configuration repository located at `~/.config`. It contains configurations for a tiling window manager workflow using AeroSpace, along with terminal, editor, and UI customizations.

## Key Components

### AeroSpace Window Manager (`aerospace/`)
- **Configuration**: `aerospace/aerospace.toml`
- Tiling window manager for macOS with i3/Sway-like keybindings, single-monitor setup
- Window actions use **Option/Alt** (the macOS equivalent of Linux Super); app launching is on the Karabiner Hyper key, not AeroSpace
- Uses vim-style navigation (Alt+h/j/k/l for focus, Alt+Shift+h/j/k/l for moving windows)
- Alt+q close, Alt+f fullscreen, Alt+t toggle floating, Alt+1..9 workspaces, Alt+Shift+1..9 move-and-follow
- 8px gaps (44px top to clear the bar); no mouse-follows-focus
- Automatic app placement rules (fire only at window creation — windows move freely afterwards):
  - Workspace 1: Ghostty · 2: Zen/Safari/Firefox · 3: Discord · 4: Obsidian · 5: Spotify/Apple Music · 6: Claude Desktop
  - Finder and System Settings float
- Launches JankyBorders on startup (`aerospace/../borders/bordersrc`): focused window `#7dcfff` cyan, unfocused `#565f89` dimmed grey, 7px round
- Configuration changes: Edit `aerospace.toml`, then Alt+Shift+; → r to reload

### SketchyBar Status Bar (`sketchybar/`)
- **Main config**: `sketchybar/sketchybarrc`
- **Plugins**: `sketchybar/plugins/*.sh`
- **Colors**: `sketchybar/colors.sh` (Tokyonight Night theme)
- Workspace indicators (left) sync with AeroSpace via `aerospace_workspace_change` trigger; only occupied workspaces + the focused one are shown (`plugins/workspaces.sh` batch-updates all items per event). Focused = cyan pill, occupied = dimmed number, empty = hidden
- Left: workspaces, front app; Right: now-playing (Spotify/Apple Music via AppleScript polling), volume, battery, clock
- The native macOS menu bar is auto-hidden (`defaults write NSGlobalDomain _HIHideMenuBar -bool true`) so SketchyBar is the only top bar
- Reload: `sketchybar --reload` (or `brew services restart sketchybar`)

### JankyBorders (`borders/`)
- **Configuration**: `borders/bordersrc` — executed by the `borders` process on launch
- Started by AeroSpace's `after-startup-command`; edit bordersrc then rerun `borders <options>` or restart AeroSpace to apply

### Neovim (`nvim/`)
- Minimal single-file config using Neovim 0.12's native `vim.pack.add()` package manager (no lazy.nvim, no LazyVim)
- **Entry point**: `nvim/init.lua` — all config lives in this one file
- **Plugins**: fzf-lua (fuzzy finder), tokyonight.nvim (colorscheme), which-key.nvim, nvim-treesitter, gitsigns.nvim, mason.nvim, mini.surround, mini.pairs
- **LSP**: native `vim.lsp` API (no lspconfig); lua_ls and zls pre-configured; install servers via `:MasonInstall <name>`
- **Leader**: Space; key groups: `<leader>f` find, `<leader>g` git, `<leader>l` lsp, `<leader>x` diagnostics, `<leader>s` splits, `<leader>b` buffers

### WezTerm (`wezterm/`)
- **Configuration**: `wezterm/wezterm.lua`
- Minimal configuration with 24pt font size

### Karabiner-Elements (`karabiner/`)
- **Configuration**: `karabiner/karabiner.json`
- **Caps Lock**: Escape (tap) / Left Control (hold)
- **Right Command**: Hyper key — sets a `hyper` variable while held
- **Hyper + key → app launch** (mirrors the Hyprland `$hyper` app layer):
  Return=Ghostty, B=Zen, E=Finder, D=Discord, M=Spotify, O=Obsidian,
  C=Calculator, I=Calendar, comma=Messages

## Configuration Workflow

### Editing Aerospace Configuration
1. Edit `~/.config/aerospace/aerospace.toml`
2. Reload: Alt+Shift+; then 'r' (or restart AeroSpace)

### Editing SketchyBar
1. Edit `~/.config/sketchybar/sketchybarrc` or plugin scripts
2. Reload: `brew services restart sketchybar`

### Editing Neovim Configuration
1. Edit `~/.config/nvim/init.lua`
2. Restart Neovim (changes don't hot-reload)

### Editing Karabiner
1. Edit `~/.config/karabiner/karabiner.json`
2. Karabiner auto-reloads on file changes

## Integration Points

- **AeroSpace ↔ SketchyBar**: AeroSpace triggers `aerospace_workspace_change` event on workspace switches, which updates SketchyBar workspace indicators
- **AeroSpace ↔ JankyBorders**: Borders launched via `after-startup-command` in aerospace.toml
- **Karabiner Hyper Key**: Can be used to create global shortcuts that don't conflict with app-specific keybindings

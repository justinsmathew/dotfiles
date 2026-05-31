# Dotfiles

My personal macOS configuration files for a tiling window manager workflow.

## What's Included

- **AeroSpace** - Tiling window manager with i3/Sway-like keybindings
- **SketchyBar** - macOS status bar with Catppuccin Mocha theme
- **Neovim** - LazyVim distribution
- **WezTerm** - GPU-accelerated terminal
- **Karabiner-Elements** - Keyboard customization (Caps Lock → Escape/Control, Right Command → Hyper)

## Requirements

- macOS (tested on macOS Sequoia 15.0+)
- [Homebrew](https://brew.sh/)

### Install Dependencies

```bash
# Window manager and UI
brew install --cask aerospace
brew install sketchybar
brew install borders  # JankyBorders

# Terminal
brew install --cask wezterm

# Editor
brew install neovim

# Keyboard customization
brew install --cask karabiner-elements

# Fonts
brew install --cask font-jetbrains-mono-nerd-font
```

## Installation

1. Clone this repository:
```bash
git clone https://github.com/justinsmathew/dotfiles.git ~/dotfiles
```

2. Create symlinks to config directory:
```bash
ln -s ~/dotfiles/config/aerospace ~/.config/aerospace
ln -s ~/dotfiles/config/karabiner ~/.config/karabiner
ln -s ~/dotfiles/config/nvim ~/.config/nvim
ln -s ~/dotfiles/config/sketchybar ~/.config/sketchybar
ln -s ~/dotfiles/config/wezterm ~/.config/wezterm
```

3. Start services:
```bash
# AeroSpace starts at login (configured in aerospace.toml)
brew services start sketchybar
```

## Key Features

### Keybindings (mirrors Linux/Hyprland)

**Window actions — Option (⌥), the macOS equivalent of Linux Super (AeroSpace):**

- **Focus windows**: Alt+h/j/k/l (vim-style)
- **Move windows**: Alt+Shift+h/j/k/l
- **Switch workspaces**: Alt+1-9 (Alt+0 = workspace 10)
- **Move to workspace**: Alt+Shift+1-9
- **Close window**: Alt+q · **Fullscreen**: Alt+f · **Toggle floating**: Alt+t

**Launch apps — Hyper (Right Command) via Karabiner:**

- Hyper+Return → WezTerm
- Hyper+B → Zen Browser · Hyper+E → Finder · Hyper+D → Discord
- Hyper+M → Spotify · Hyper+O → Obsidian · Hyper+C → Calculator
- Hyper+I → Calendar · Hyper+, → Messages

**Launcher:** ⌘Space → Alfred

### Workspace Layout

1. WezTerm (auto)
2. Zen Browser (auto)
3. Discord (auto)
4. (unused)
5. Spotify (auto)

### Karabiner

- **Caps Lock**: Escape (tap) / Left Control (hold)
- **Right Command**: Hyper key (hold) — drives the app launcher above

## File Structure

```
~/dotfiles/
├── CLAUDE.md          # AI assistant context
├── README.md          # This file
├── .gitignore
└── config/
    ├── aerospace/
    ├── karabiner/
    ├── nvim/
    ├── sketchybar/
    └── wezterm/
```

## Configuration Notes

See [CLAUDE.md](CLAUDE.md) for detailed architecture and configuration workflow.

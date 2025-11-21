# Dotfiles

My personal macOS configuration files for a tiling window manager workflow.

## What's Included

- **AeroSpace** - Tiling window manager with i3/Sway-like keybindings
- **SketchyBar** - macOS status bar with Catppuccin Mocha theme
- **Neovim** - LazyVim distribution
- **WezTerm** - GPU-accelerated terminal
- **Karabiner-Elements** - Keyboard customization (Caps Lock → Hyper/Escape)
- **Fish** - Modern shell configuration
- **Helix** - Modal text editor configuration

## Requirements

- macOS (tested on macOS Sequoia 15.0+)
- [Homebrew](https://brew.sh/)

### Install Dependencies

```bash
# Window manager and UI
brew install --cask aerospace
brew install sketchybar
brew install borders  # JankyBorders

# Terminal and shell
brew install --cask wezterm
brew install fish

# Editors
brew install neovim
brew install helix

# Keyboard customization
brew install --cask karabiner-elements

# Fonts
brew install --cask font-jetbrains-mono-nerd-font
```

## Installation

1. Clone this repository:
```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
```

2. Create symlinks to config directory:
```bash
ln -s ~/dotfiles/config/aerospace ~/.config/aerospace
ln -s ~/dotfiles/config/fish ~/.config/fish
ln -s ~/dotfiles/config/helix ~/.config/helix
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

### AeroSpace Keybindings

- **Focus windows**: Alt+h/j/k/l (vim-style)
- **Move windows**: Alt+Shift+h/j/k/l
- **Switch workspaces**: Alt+1-9
- **Move to workspace**: Alt+Shift+1-9
- **Launch apps**:
  - Ctrl+Shift+Enter (WezTerm)
  - Ctrl+Shift+B (Zen Browser)
  - Ctrl+Shift+D (Discord)
  - Ctrl+Shift+M (Spotify)

### Workspace Layout

1. WezTerm (auto)
2. Zen Browser (auto)
3. Discord (auto)
4. (unused)
5. Spotify (auto)

### Karabiner

- **Caps Lock**: Hyper key when held, Escape when tapped

## File Structure

```
~/dotfiles/
├── CLAUDE.md          # AI assistant context
├── README.md          # This file
├── .gitignore
└── config/
    ├── aerospace/
    ├── fish/
    ├── helix/
    ├── karabiner/
    ├── nvim/
    ├── sketchybar/
    └── wezterm/
```

## Configuration Notes

See [CLAUDE.md](CLAUDE.md) for detailed architecture and configuration workflow.

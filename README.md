# Dotfiles

My personal macOS configuration files for a tiling window manager workflow.

## What's Included

- **AeroSpace** - Tiling window manager with i3/Sway-like keybindings
- **SketchyBar** - macOS status bar, Tokyonight Night theme
- **JankyBorders** - Focused-window border ring
- **Ghostty** - GPU-accelerated terminal (primary)
- **Neovim** - Minimal single-file config on Neovim 0.12's native `vim.pack`
- **Nushell** - Login shell, with Starship prompt
- **Karabiner-Elements** - Keyboard customization (Caps Lock → Escape/Control, Right Command → Hyper)

`config/wezterm/` and `config/windows/` are kept for reference but are not the
active setup.

## Requirements

- macOS (tested on macOS Tahoe 26.5)
- [Homebrew](https://brew.sh/)

### Install Dependencies

```bash
# Window manager and UI
brew install --cask aerospace
brew install sketchybar
brew install borders  # JankyBorders

# Terminal and shell
brew install --cask ghostty
brew install nushell starship

# Editor — Neovim 0.12+ required for vim.pack
brew install neovim tree-sitter-cli

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

2. Create symlinks:
```bash
ln -s ~/dotfiles/config/aerospace     ~/.config/aerospace
ln -s ~/dotfiles/config/borders       ~/.config/borders
ln -s ~/dotfiles/config/ghostty       ~/.config/ghostty
ln -s ~/dotfiles/config/karabiner     ~/.config/karabiner
ln -s ~/dotfiles/config/nvim          ~/.config/nvim
ln -s ~/dotfiles/config/sketchybar    ~/.config/sketchybar
ln -s ~/dotfiles/config/starship.toml ~/.config/starship.toml

# Nushell reads from Application Support on macOS, not ~/.config
ln -s ~/dotfiles/config/nushell/config.nu \
      ~/Library/Application\ Support/nushell/config.nu
ln -s ~/dotfiles/config/nushell/env.nu \
      ~/Library/Application\ Support/nushell/env.nu
```

Note: Ghostty also reads `~/Library/Application Support/com.mitchellh.ghostty/config`
and that file **wins** over `~/.config/ghostty/config` on scalar settings. Leave it
absent so the version-controlled config is the only source of truth.

3. Start services:
```bash
# AeroSpace starts at login (configured in aerospace.toml)
# AeroSpace also launches JankyBorders via after-startup-command
brew services start sketchybar
```

## Key Features

### Keybindings (mirrors Linux/Hyprland)

**Window actions — Option (⌥), the macOS equivalent of Linux Super (AeroSpace):**

- **Focus windows**: Alt+h/j/k/l (vim-style)
- **Move windows**: Alt+Shift+h/j/k/l
- **Switch workspaces**: Alt+1-9
- **Move to workspace**: Alt+Shift+1-9 (moves and follows)
- **Cycle windows**: Alt+Tab
- **Close window**: Alt+q · **Fullscreen**: Alt+f · **Toggle floating**: Alt+t
- **Layouts**: Alt+/ tiles · Alt+, accordion

**Launch apps — Hyper (Right Command) via Karabiner:**

- Hyper+Return → Ghostty
- Hyper+B → Helium · Hyper+E → Finder · Hyper+D → Discord
- Hyper+M → Spotify · Hyper+O → Obsidian · Hyper+C → Calculator
- Hyper+I → Calendar · Hyper+, → Messages

**Launcher:** ⌘Space → Alfred

**Terminal (Ghostty):** `cmd+s` is the prefix — `cmd+s>\` / `cmd+s>-` split,
`cmd+s>h/j/k/l` navigate splits, `cmd+s>c` new tab, `cmd+s>r` reload config.

### Workspace Layout

Workspaces 1-5 are persistent; 6-9 are created on demand. Placement rules fire
only at window creation, so windows can be moved freely afterwards.

1. Ghostty
2. Helium / Zen / Safari / Firefox
3. Discord
4. Obsidian
5. Spotify / Apple Music
6. Claude Desktop

Finder and System Settings float instead of tiling.

### Neovim

Single-file config at `config/nvim/init.lua` using Neovim 0.12's native
`vim.pack` package manager and native `vim.lsp` API — no lazy.nvim, no
lspconfig. Leader is Space.

- Plugins: fzf-lua, tokyonight, which-key, nvim-treesitter, gitsigns, mason,
  mini.surround, mini.pairs
- Key groups: `<leader>f` find · `<leader>g` git · `<leader>l` lsp ·
  `<leader>x` diagnostics · `<leader>s` splits · `<leader>b` buffers
- LSP servers install via `:MasonInstall lua-language-server zls`

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
    ├── borders/
    ├── ghostty/
    ├── karabiner/
    ├── nushell/
    ├── nvim/
    ├── sketchybar/
    ├── starship.toml
    ├── wezterm/       # reference only
    └── windows/       # reference only
```

## Configuration Notes

See [CLAUDE.md](CLAUDE.md) for detailed architecture and configuration workflow.

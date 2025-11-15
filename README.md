# dotfiles

Personal configuration files for my development environment.

## 🎨 Theme

All applications are configured with the **Catppuccin Mocha** color scheme for a consistent visual experience.

## 📦 Configured Applications

- **Niri** - Wayland compositor with infinite horizontal scrolling
- **Waybar** - Status bar (horizontal, top position)
- **Alacritty** - Terminal emulator
- **Helix** - Text editor
- **Fuzzel** - Application launcher
- **Mako** - Notification daemon

## 📁 Repository Structure

```
dotfiles/
├── niri/
│   └── config.kdl         # Window manager configuration
├── waybar/
│   ├── config             # Status bar modules
│   └── style.css          # Catppuccin Mocha styling
├── alacritty/
│   ├── alacritty.toml     # Terminal configuration
│   └── catppuccin-mocha.toml
├── helix/
│   └── config.toml        # Editor configuration
├── fuzzel/
│   └── fuzzel.ini         # Launcher configuration
├── mako/
│   └── config             # Notification configuration
└── bin/
    └── lastshot           # Script to find latest screenshot
```

## ✨ Key Customizations

### Niri
- 8px gaps between windows
- 3px gradient borders (pink → yellow)
- Touchpad gestures for workspace navigation
- Screenshots: `Print` (full screen), `Super+Shift+S` (area selection) → clipboard + file

### Waybar
- Minimal horizontal layout
- Catppuccin Mocha colors
- Network, workspaces, clock, CPU, memory, battery modules

### Alacritty
- Square windows (no decorations)
- JetBrainsMono Nerd Font
- 98% opacity

### Helix
- Relative line numbers
- Auto-save enabled
- Custom keybindings (Ctrl+S to save, Ctrl+P for file picker)

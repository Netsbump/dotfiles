# 🌊 Niri Wayland Dotfiles

Personal configuration for **Niri**, a Wayland compositor with infinite horizontal scrolling.

---

## 📋 Table of Contents

1. [Tech Stack](#tech-stack)
2. [Repository Structure](#repository-structure)
3. [Keyboard Shortcuts](#keyboard-shortcuts)
4. [Customization](#customization)
5. [Resources](#resources)

---

This repo contains my complete configuration for a minimal and performant desktop environment based on **Niri**.

- **Niri**: Wayland window manager with infinite horizontal scrolling (windows are added in columns to the right)
- **Wayland**: Modern display protocol replacing X11 (better security, performance, HiDPI support)

## 🏗️ Tech Stack

### Compositor & Protocol

- **Niri**: Wayland compositor (the "engine" managing windows)
- **XWayland-Satellite**: Allows running legacy X11 apps (VS Code, Discord, Steam, etc.)

### User Interface

- **Waybar**: Status bar at the top (displays workspaces, network, battery, CPU, RAM, clock)
- **Fuzzel**: Application launcher (equivalent to Rofi/Wofi for Wayland)
- **Mako**: Notification daemon (popup when an app notifies you)

### System Tools

- **Alacritty**: GPU-accelerated terminal emulator
- **Grim + Slurp + Satty**: Complete screenshot stack with annotation
  - Grim = takes the capture
  - Slurp = selects the area
  - Satty = edits/annotates the image
- **Swaybg**: Wallpaper manager
- **Swaylock**: Screen locker
- **Brightnessctl**: Brightness control (Fn+brightness keys)
- **Pavucontrol**: GUI for audio control

### System Integration

- **XDG Desktop Portals**: Allow apps to access the system securely (file picker, screen sharing)

---

## 📁 Repository Structure

```
dotfiles/
├── README.md              # This file
├── packages.txt           # Package list with explanations
├── install.sh             # Automated installation script
├── niri/
│   └── config.kdl         # Niri configuration (shortcuts, layout, startup)
├── waybar/
│   ├── config             # Waybar config (displayed modules)
│   └── style.css          # Waybar style (colors, fonts)
├── fuzzel/
│   └── fuzzel.ini         # Fuzzel config (theme, behavior)
└── mako/
    └── config             # Mako config (notifications)
```

---

## ⌨️ Keyboard Shortcuts

**Modifier**: `Super` (Windows key)

### Essentials

| Shortcut | Action |
|----------|--------|
| `Super + Enter` | Open terminal (Alacritty) |
| `Super + D` | Application launcher (Fuzzel) |
| `Super + Q` | Close active window |
| `Super + Shift + E` | Quit Niri |

### Navigation (Infinite horizontal scrolling)

| Shortcut | Action |
|----------|--------|
| `Super + H/L` or `←/→` | Navigate between columns (left/right) |
| `Super + J/K` or `↑/↓` | Navigate between windows in a column |
| `Touchpad 3 fingers ←→` | Horizontal scroll between columns |

### Workspaces (Virtual desktops)

| Shortcut | Action |
|----------|--------|
| `Super + 1-9` | Go to workspace 1-9 |
| `Super + Shift + 1-9` | Move window to workspace 1-9 |
| `Super + U/I` | Navigate between workspaces (up/down) |
| `Touchpad 3 fingers ↑↓` | Switch workspace |

### Window Management

| Shortcut | Action |
|----------|--------|
| `Super + Shift + H/J/K/L` | Move window |
| `Super + F` | Fullscreen |
| `Super + -/+` | Decrease/increase column width |
| `Super + Shift + -/+` | Decrease/increase window height |

### Screenshots

| Shortcut | Action |
|----------|--------|
| `Print` | Full screenshot |
| `Super + Shift + S` | **Screenshot area + annotation (Satty)** |
| `Shift + Print` | Screenshot of a screen (multi-monitor) |
| `Ctrl + Print` | Screenshot of active window |

### System

| Shortcut | Action |
|----------|--------|
| `Super + Shift + C` | Reload Niri config |
| `Fn + Brightness` | Control brightness (brightnessctl) |
| `Fn + Volume` | Control volume (pactl) |

---

## 🎨 Customization

### Change Wallpaper

Edit `~/.config/niri/config.kdl`:

```kdl
spawn-at-startup "swaybg" "-i" "/path/to/your/wallpaper.png" "-m" "fill"
```

### Modify Colors (Tokyo Night already configured)

Niri uses **Tokyo Night** colors by default:
- Active border: `#7aa2f7` (blue)
- Inactive border: `#565f89` (gray)

To change, edit `~/.config/niri/config.kdl` section `layout { border { ... } }`.

### Customize Waybar

- **Modules**: `~/.config/waybar/config`
- **Style**: `~/.config/waybar/style.css`

---

## 📚 Resources

- [Official Niri Documentation](https://github.com/YaLTeR/niri)
- [Arch Wayland Wiki](https://wiki.archlinux.org/title/Wayland)
- [Waybar Examples](https://github.com/Alexays/Waybar/wiki/Examples)

---

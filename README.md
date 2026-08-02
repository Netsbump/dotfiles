# dotfiles

Config files for Helix, Fish, Alacritty, Zellij, Herdr, Lazygit, Ghostty, and Yazi.

## Contents

| App | Files |
|-----|-------|
| [Helix](https://helix-editor.com) | `config.toml`, `languages.toml`, `themes/modern-vesper.toml` |
| [Fish](https://fishshell.com) | `config.fish` |
| [Alacritty](https://alacritty.org) | `alacritty.toml`, `dank-theme.toml` |
| [Zellij](https://zellij.dev) | `config.kdl` |
| [Herdr](https://herdr.dev) | `config.toml`, `sounds/`, `herdr-wizz-watch`, `herdr-wizz-watch.service`, `install-plugins.sh` |
| [Lazygit](https://github.com/jesseduffield/lazygit) | `config.yml` |
| [Ghostty](https://ghostty.org) | `config` |
| [Yazi](https://yazi-rs.github.io) | `yazi.toml`, `theme.toml`, `package.toml` |

## Install

```bash
git clone git@github.com:Netsbump/dotfiles.git ~/dotfiles
cd ~/dotfiles && bash install.sh
```

The script creates symlinks from `~/.config/` to this repo.
Existing configs are backed up as `*.bak` before being replaced.

## Tools used by these configs

`install.sh` only creates symlinks in `~/.config`. It does **not** install packages or Herdr plugins.

Herdr plugins are managed separately to avoid hidden network installs during dotfile setup:

```bash
./herdr/install-plugins.sh
```

### Herdr sounds and MSN wizz watcher

The Herdr config uses relative sound paths:

```toml
done_path = "sounds/msn-message.mp3"
request_path = "sounds/nudge.mp3"
```

`install.sh` links `herdr/sounds` into `~/.config/herdr/sounds`, so the mp3 files travel with the dotfiles repo.

To enable the “wizz if a done task stays unread for 5 minutes” watcher on a machine:

```bash
systemctl --user daemon-reload
systemctl --user enable --now herdr-wizz-watch.service
```

The watcher needs one audio player. On Fedora, for example:

```bash
sudo dnf install mpg123
```

### Runtime tools (used by your configs)

- `helix` — editor used by `helix/config.toml` and `helix/languages.toml`
- `ghostty` — terminal needed only if you want to use `ghostty/config`
- `zellij` — terminal multiplexer using `zellij/config.kdl`
- `yazi` — file manager using `yazi/yazi.toml` and `yazi/theme.toml`
- `herdr` — terminal workspace manager using `herdr/config.toml`
- `lazygit` — Git TUI using `lazygit/config.yml`
- `typescript-language-server` — JS/TS LSP used in `helix/languages.toml`
- `prettier` — formatter for JS/TS/JSX/TSX/Markdown in `helix/languages.toml`
- `rust-analyzer` — Rust LSP used by Helix
- `starship` — prompt used by `fish/config.fish`
- `fnm` — Node.js version manager used by `fish/config.fish`
- `tealdeer` (or `tldr`) — helper command used from Fish aliases/functions

### Optional/dev tools (workflow only)

- `pnpm` — Node workflow tool, not required for terminal/editor startup
- `podman` *(optional)* — useful for container-based workflows
- `.NET SDK` *(optional)* — only needed for dotnet-based projects/tools

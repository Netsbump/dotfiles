# dotfiles

Config files for Helix, Fish, Alacritty, Zellij, Ghostty, and Yazi.

## Contents

| App | Files |
|-----|-------|
| [Helix](https://helix-editor.com) | `config.toml`, `languages.toml`, `themes/modern-vesper.toml` |
| [Fish](https://fishshell.com) | `config.fish` |
| [Alacritty](https://alacritty.org) | `alacritty.toml`, `dank-theme.toml` |
| [Zellij](https://zellij.dev) | `config.kdl` |
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

`install.sh` only creates symlinks in `~/.config`. It does **not** install packages.

### Runtime tools (used by your configs)

- `helix` — editor used by `helix/config.toml` and `helix/languages.toml`
- `ghostty` — terminal needed only if you want to use `ghostty/config`
- `zellij` — terminal multiplexer using `zellij/config.kdl`
- `yazi` — file manager using `yazi/yazi.toml` and `yazi/theme.toml`
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

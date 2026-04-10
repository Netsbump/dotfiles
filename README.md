# dotfiles

Config files for Helix, Fish, and Alacritty.

## Contents

| App | Files |
|-----|-------|
| [Helix](https://helix-editor.com) | `config.toml`, `languages.toml` |
| [Fish](https://fishshell.com) | `config.fish` |
| [Alacritty](https://alacritty.org) | `alacritty.toml`, `dank-theme.toml` |

## Install

```bash
git clone git@github.com:Netsbump/dotfiles.git ~/dotfiles
cd ~/dotfiles && bash install.sh
```

The script creates symlinks from `~/.config/` to this repo.
Existing configs are backed up as `*.bak` before being replaced.

## Dependencies

Make sure these are installed before running helix/fish:

- `helix` — editor
- `typescript-language-server` — TS/JS LSP
- `prettier` — formatter for TS/JS/JSX/TSX
- `rust-analyzer` — Rust LSP (bundled with helix via `hx --grammar fetch`)
- `starship` — prompt
- `fnm` — Node.js version manager
- `pnpm` — package manager
- `tealdeer` (or `tldr`) — simplified man pages
- `podman` *(optional)* — enables `DOCKER_HOST` socket for lazydocker/testcontainers
- `.NET SDK` *(optional)* — enables `dotnet` tools on PATH

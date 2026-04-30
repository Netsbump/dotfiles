#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -f "$dst" ] && [ ! -L "$dst" ]; then
    echo "  [backup] $dst -> $dst.bak"
    mv "$dst" "$dst.bak"
  fi
  ln -sf "$src" "$dst"
  echo "  [linked] $dst"
}

echo "Installing dotfiles from $DOTFILES_DIR"
echo ""

echo "-> Helix"
link "$DOTFILES_DIR/helix/config.toml"     "$HOME/.config/helix/config.toml"
link "$DOTFILES_DIR/helix/languages.toml"  "$HOME/.config/helix/languages.toml"

echo "-> Fish"
link "$DOTFILES_DIR/fish/config.fish"      "$HOME/.config/fish/config.fish"

echo "-> Alacritty"
link "$DOTFILES_DIR/alacritty/alacritty.toml"  "$HOME/.config/alacritty/alacritty.toml"
link "$DOTFILES_DIR/alacritty/dank-theme.toml" "$HOME/.config/alacritty/dank-theme.toml"

echo "-> Ghostty"
link "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"

echo ""
echo "Done! Restart your shell and helix for changes to take effect."

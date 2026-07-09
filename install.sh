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
link "$DOTFILES_DIR/helix/themes/modern-vesper.toml" "$HOME/.config/helix/themes/modern-vesper.toml"
link "$DOTFILES_DIR/helix/runtime/queries/typescript/highlights.scm" "$HOME/.config/helix/runtime/queries/typescript/highlights.scm"

echo "-> Fish"
link "$DOTFILES_DIR/fish/config.fish"      "$HOME/.config/fish/config.fish"

echo "-> Alacritty"
link "$DOTFILES_DIR/alacritty/alacritty.toml"  "$HOME/.config/alacritty/alacritty.toml"
link "$DOTFILES_DIR/alacritty/dank-theme.toml" "$HOME/.config/alacritty/dank-theme.toml"

echo "-> Zellij"
link "$DOTFILES_DIR/zellij/config.kdl" "$HOME/.config/zellij/config.kdl"

echo "-> Herdr"
link "$DOTFILES_DIR/herdr/config.toml" "$HOME/.config/herdr/config.toml"

echo "-> Lazygit"
link "$DOTFILES_DIR/lazygit/config.yml" "$HOME/.config/lazygit/config.yml"

echo "-> Ghostty"
link "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"

echo "-> Yazi"
link "$DOTFILES_DIR/yazi/yazi.toml" "$HOME/.config/yazi/yazi.toml"
link "$DOTFILES_DIR/yazi/theme.toml" "$HOME/.config/yazi/theme.toml"
link "$DOTFILES_DIR/yazi/package.toml" "$HOME/.config/yazi/package.toml"

echo ""
echo "Done! Restart your shell, Helix, Lazygit, and Yazi for changes to take effect."

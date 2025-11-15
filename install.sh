#!/bin/bash
# Script d'installation des dotfiles Niri
# Usage: ./install.sh

set -e  # Arrêter en cas d'erreur

# Couleurs pour l'affichage
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Installation des dotfiles Niri${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Chemin du repo dotfiles
DOTFILES_DIR="$HOME/dotfiles"

# Vérifier qu'on est dans le bon répertoire
if [ ! -f "$DOTFILES_DIR/README.md" ]; then
    echo -e "${RED}❌ Erreur: Le repo dotfiles n'est pas dans ~/dotfiles${NC}"
    echo -e "${YELLOW}   Clonez d'abord le repo: git clone <URL> ~/dotfiles${NC}"
    exit 1
fi

echo -e "${GREEN}✓${NC} Repo dotfiles trouvé dans $DOTFILES_DIR"
echo ""

# Fonction pour copier une config avec backup
install_config() {
    local config_name=$1
    local source_dir="$DOTFILES_DIR/$config_name"
    local target_dir="$HOME/.config/$config_name"

    echo -e "${BLUE}→${NC} Installation de $config_name..."

    # Vérifier que la source existe
    if [ ! -d "$source_dir" ]; then
        echo -e "${YELLOW}  ⚠ Dossier $config_name non trouvé, ignoré${NC}"
        return
    fi

    # Backup si config existe déjà
    if [ -d "$target_dir" ]; then
        backup_dir="$target_dir.backup-$(date +%Y%m%d-%H%M%S)"
        echo -e "${YELLOW}  ⚠ Config existante détectée, backup dans:${NC}"
        echo -e "${YELLOW}    $backup_dir${NC}"
        mv "$target_dir" "$backup_dir"
    fi

    # Créer le répertoire parent si nécessaire
    mkdir -p "$(dirname "$target_dir")"

    # Copier la config
    cp -r "$source_dir" "$target_dir"
    echo -e "${GREEN}  ✓${NC} $config_name installé"
}

# Installation des configs
echo -e "${BLUE}Installation des fichiers de configuration...${NC}"
echo ""

install_config "niri"
install_config "waybar"
install_config "fuzzel"
install_config "mako"

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  ✓ Installation terminée !${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${BLUE}Prochaines étapes :${NC}"
echo ""
echo -e "1. ${YELLOW}Installer les packages${NC} (si pas déjà fait) :"
echo -e "   ${GREEN}sudo pacman -S niri xwayland-satellite waybar fuzzel mako \\${NC}"
echo -e "   ${GREEN}                  grim slurp satty alacritty swaybg swaylock \\${NC}"
echo -e "   ${GREEN}                  brightnessctl pavucontrol wl-clipboard \\${NC}"
echo -e "   ${GREEN}                  xdg-desktop-portal-gtk xdg-desktop-portal-gnome \\${NC}"
echo -e "   ${GREEN}                  ttf-jetbrains-mono-nerd${NC}"
echo ""
echo -e "2. ${YELLOW}Se déconnecter${NC} et sélectionner ${GREEN}Niri${NC} dans le menu de session"
echo ""
echo -e "3. ${YELLOW}Raccourcis essentiels${NC} :"
echo -e "   ${GREEN}Super+Enter${NC}     → Terminal"
echo -e "   ${GREEN}Super+D${NC}         → Lanceur d'applications"
echo -e "   ${GREEN}Super+Shift+E${NC}   → Quitter Niri"
echo -e "   ${GREEN}Super+Shift+S${NC}   → Screenshot avec annotation"
echo ""
echo -e "${BLUE}Consultez le README.md pour plus d'infos !${NC}"
echo ""

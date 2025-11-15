# 🌊 Niri Wayland Dotfiles

Configuration personnelle pour **Niri**, un compositeur Wayland avec scrolling infini horizontal.

---

## 📋 Table des matières

1. [Qu'est-ce que c'est ?](#quest-ce-que-cest-)
2. [Stack technique](#stack-technique)
3. [Prérequis](#prérequis)
4. [Installation](#installation)
5. [Structure du repo](#structure-du-repo)
6. [Raccourcis clavier](#raccourcis-clavier)
7. [Personnalisation](#personnalisation)

---

## 🤔 Qu'est-ce que c'est ?

Ce repo contient ma configuration complète pour un environnement de bureau minimal et performant basé sur **Niri**.

### Philosophie

- **Niri** : Gestionnaire de fenêtres Wayland avec scrolling infini horizontal (les fenêtres s'ajoutent en colonnes vers la droite)
- **Wayland** : Protocole d'affichage moderne remplaçant X11 (meilleure sécurité, performances, support HiDPI)
- **Minimaliste** : Seulement les outils essentiels, pas d'environnement de bureau complet (pas de GNOME/KDE)
- **Configurable** : Tout est dans des fichiers texte versionables

### Différence avec un tiling WM classique (i3/Sway)

| Sway/i3 | Niri |
|---------|------|
| Subdivise l'écran en zones | Colonnes infinies vers la droite |
| Fenêtres se redimensionnent automatiquement | Fenêtres gardent leur taille |
| Navigation 2D limitée | Scroll infini horizontal |

---

## 🏗️ Stack technique

### Compositeur & Protocole

- **Niri** : Compositeur Wayland (le "moteur" qui gère les fenêtres)
- **XWayland-Satellite** : Permet d'exécuter les apps X11 legacy (VS Code, Discord, Steam, etc.)

### Interface utilisateur

- **Waybar** : Barre de statut en haut (affiche workspaces, réseau, batterie, CPU, RAM, horloge)
- **Fuzzel** : Lanceur d'applications (équivalent de Rofi/Wofi pour Wayland)
- **Mako** : Daemon de notifications (popup quand une app vous notifie)

### Outils système

- **Alacritty** : Émulateur de terminal GPU-accelerated
- **Grim + Slurp + Satty** : Stack complète de screenshots avec annotation
  - Grim = prend la capture
  - Slurp = sélectionne la zone
  - Satty = édite/annote l'image
- **Swaybg** : Fond d'écran
- **Swaylock** : Écran de verrouillage
- **Brightnessctl** : Contrôle de la luminosité (touches Fn+luminosité)
- **Pavucontrol** : GUI pour contrôler le son

### Intégration système

- **XDG Desktop Portals** : Permettent aux apps d'accéder au système de manière sécurisée (file picker, partage d'écran)

---

## ✅ Prérequis

- **OS** : Manjaro, Arch Linux, ou toute distro Arch-based
- **Accès sudo** : Pour installer les packages
- **Git** : Pour cloner ce repo

---

## 📦 Installation

### 1. Cloner le repo

```bash
git clone https://github.com/VOTRE_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Installer les packages

```bash
# Lire la liste des packages avec explications
cat packages.txt

# Installer tous les packages essentiels
sudo pacman -S niri xwayland-satellite waybar fuzzel mako \
               grim slurp satty alacritty swaybg swaylock swayidle \
               brightnessctl pavucontrol wl-clipboard \
               xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-gnome \
               ttf-jetbrains-mono-nerd
```

### 3. Déployer les configs

```bash
# Lancer le script d'installation (à venir)
./install.sh

# Ou manuellement :
cp -r niri ~/.config/
cp -r waybar ~/.config/
cp -r fuzzel ~/.config/
cp -r mako ~/.config/
```

### 4. Lancer Niri

1. Déconnectez-vous de votre session actuelle
2. À l'écran de connexion, sélectionnez **Niri** dans le menu des sessions
3. Connectez-vous

---

## 📁 Structure du repo

```
dotfiles/
├── README.md              # Ce fichier
├── packages.txt           # Liste des packages avec explications
├── install.sh             # Script d'installation automatique (à venir)
├── niri/
│   └── config.kdl         # Configuration Niri (raccourcis, layout, startup)
├── waybar/
│   ├── config             # Config waybar (modules affichés)
│   └── style.css          # Style waybar (couleurs, polices)
├── fuzzel/
│   └── fuzzel.ini         # Config fuzzel (thème, comportement)
└── mako/
    └── config             # Config mako (notifications)
```

---

## ⌨️ Raccourcis clavier

**Modificateur** : `Super` (touche Windows)

### Essentiels

| Raccourci | Action |
|-----------|--------|
| `Super + Enter` | Ouvrir un terminal (Alacritty) |
| `Super + D` | Lanceur d'applications (Fuzzel) |
| `Super + Q` | Fermer la fenêtre active |
| `Super + Shift + E` | Quitter Niri |

### Navigation (Scrolling horizontal infini)

| Raccourci | Action |
|-----------|--------|
| `Super + H/L` ou `←/→` | Naviguer entre colonnes (gauche/droite) |
| `Super + J/K` ou `↑/↓` | Naviguer entre fenêtres dans une colonne |
| `Touchpad 3 doigts ←→` | Scroll horizontal entre colonnes |

### Workspaces (Bureaux virtuels)

| Raccourci | Action |
|-----------|--------|
| `Super + 1-9` | Aller au workspace 1-9 |
| `Super + Shift + 1-9` | Déplacer fenêtre vers workspace 1-9 |
| `Super + U/I` | Naviguer entre workspaces (haut/bas) |
| `Touchpad 3 doigts ↑↓` | Changer de workspace |

### Gestion des fenêtres

| Raccourci | Action |
|-----------|--------|
| `Super + Shift + H/J/K/L` | Déplacer la fenêtre |
| `Super + F` | Plein écran |
| `Super + -/+` | Réduire/agrandir largeur colonne |
| `Super + Shift + -/+` | Réduire/agrandir hauteur fenêtre |

### Screenshots

| Raccourci | Action |
|-----------|--------|
| `Print` | Screenshot complet |
| `Super + Shift + S` | **Screenshot zone + annotation (Satty)** |
| `Shift + Print` | Screenshot d'un écran (multi-moniteurs) |
| `Ctrl + Print` | Screenshot de la fenêtre active |

### Système

| Raccourci | Action |
|-----------|--------|
| `Super + Shift + C` | Recharger la config Niri |
| `Fn + Luminosité` | Contrôler la luminosité (brightnessctl) |
| `Fn + Volume` | Contrôler le volume (pactl) |

---

## 🎨 Personnalisation

### Changer le fond d'écran

Éditez `~/.config/niri/config.kdl` :

```kdl
spawn-at-startup "swaybg" "-i" "/chemin/vers/votre/wallpaper.png" "-m" "fill"
```

### Modifier les couleurs (Tokyo Night déjà configuré)

Niri utilise des couleurs **Tokyo Night** par défaut :
- Bordure active : `#7aa2f7` (bleu)
- Bordure inactive : `#565f89` (gris)

Pour changer, éditez `~/.config/niri/config.kdl` section `layout { border { ... } }`.

### Personnaliser Waybar

- **Modules** : `~/.config/waybar/config`
- **Style** : `~/.config/waybar/style.css`

---

## 🐛 Troubleshooting

### Niri ne démarre pas (écran noir)

1. Vérifiez les logs : `journalctl -b -0 | grep niri`
2. Testez la config : `niri validate`
3. Désactivez temporairement waybar/mako dans `config.kdl`

### Touches de luminosité/volume ne marchent pas

- Installez `brightnessctl` et `pulseaudio`
- Vérifiez les binds dans `~/.config/niri/config.kdl`

### Apps X11 ne se lancent pas (VS Code, Discord)

- Installez `xwayland-satellite`
- Vérifiez qu'il démarre : `spawn-at-startup "xwayland-satellite"`

---

## 📚 Ressources

- [Documentation Niri officielle](https://github.com/YaLTeR/niri)
- [Wiki Arch Wayland](https://wiki.archlinux.org/title/Wayland)
- [Waybar exemples](https://github.com/Alexays/Waybar/wiki/Examples)

---

## 📝 License

MIT - Libre d'utilisation et modification

---

**Fait avec ❤️ et beaucoup de café ☕**

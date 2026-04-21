# .dotfiles

<img src="https://img.shields.io/badge/Version-2.0.0-blue?style=for-the-badge&labelColor=gray">

Dotfiles for my Arch Linux Hyprland setup

## Components
- Kitty
- Hyprland
- Hyprlauncher
- Hyprlock
- Hypridle
- Hyprlock
- SwayNC
- Wallpapers

# Setup
```bash
cd ~
git clone https://github.com/Dev-Paxton/.dotfiles.git
cd ~/.dotfiles
for dir in ~/.dotfiles/*/; do stow -t ~ $(basename $dir); done
```

# Update
```bash
cd ~/.dotfiles
git pull
for dir in ~/.dotfiles/*/; do stow -R $(basename $dir); done
```

# Delete
```bash
cd ~/.dotfiles
for dir in ~/.dotfiles/*/; do stow -D $(basename $dir); done
rm -R ~/.dotfiles
```

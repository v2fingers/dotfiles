#!/bin/bash
set -e

cd ~ && sudo pacman -S --needed git base-devel
cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && yay --version
yay -S brave-bin

sudo pacman -Sy ripgrep unzip grim slurp github-cli cliphist wl-clipboard glfw hyprlock vulkan-devel tree-sitter-cli hyprpaper noto-fonts noto-fonts-emoji noto-fonts-extra ttf-liberation ttf-jetbrains-mono-nerd ttf-dejavu cppcheck git bluetui waybar discord spotify-launcher rofi btop neovim kitty fastfetch ninja premake cmake lua lua-language-server yazi llvm clang lldb base-devel
sudo pacman -Rns dolphin htop
sudo pacman -Rns $(pacman -Qdtq)

comm -23 <(pacman -Qqe | sort) <(expac -l '\n' '%E' base | sort -u)

mkdir -p ~/Workspace
mkdir -p ~/Pictures/Screenshots
sh -c "$(curl -sS https://vencord.dev/install.sh)"

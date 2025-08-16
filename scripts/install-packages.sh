#!/bin/bash

# i3 Developer Setup - Package Installation Script
# This script installs all required packages for the i3 configuration

set -e

echo "🚀 Installing i3 Developer Setup packages..."

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on Arch Linux
if ! command -v pacman &> /dev/null; then
    print_error "This script is designed for Arch Linux systems with pacman"
    exit 1
fi

print_status "Updating package database..."
sudo pacman -Sy

print_status "Installing core i3 packages..."
sudo pacman -S --noconfirm \
    i3-wm \
    i3blocks \
    i3lock \
    rofi \
    polybar

print_status "Installing display and window management..."
sudo pacman -S --noconfirm \
    sddm \
    sddm-kcm \
    qt5-graphicaleffects \
    qt5-quickcontrols2 \
    qt5-svg \
    picom \
    dunst \
    xss-lock \
    dex

print_status "Installing applications..."
sudo pacman -S --noconfirm \
    kitty \
    zed \
    firefox \
    thunar \
    thunar-archive-plugin \
    file-roller \
    xarchiver \
    feh \
    mupdf \
    mpv \
    flameshot

print_status "Installing fonts and theming..."
sudo pacman -S --noconfirm \
    ttf-hack-nerd \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    noto-fonts-extra \
    ttf-liberation \
    ttf-dejavu \
    papirus-icon-theme \
    materia-gtk-theme \
    breeze-gtk \
    gtk-engine-murrine

print_status "Installing system utilities..."
sudo pacman -S --noconfirm \
    brightnessctl \
    pulseaudio \
    pulseaudio-alsa \
    pavucontrol \
    networkmanager \
    network-manager-applet \
    xdg-utils \
    xorg-xrandr \
    xorg-xsetroot \
    qt5ct \
    kvantum

print_status "Installing development tools..."
sudo pacman -S --noconfirm \
    git \
    base-devel \
    vim \
    neovim

print_success "All packages installed successfully!"
print_status "Next step: Run './install-configs.sh' to set up configurations"
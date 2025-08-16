#!/bin/bash

# i3 Developer Setup - One-Command Installation
# This script installs the complete i3 developer environment

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# ASCII Art Banner
echo -e "${BLUE}"
cat << "EOF"
 ██▓▓▓  ██████▄▄▄▄▓▓▓▓▓▓▓
██████▓██▓▓▓▓██████▓▓▓▓██
██  ▓▓▓  ██▓▓▓▓██▓▓██▓▓██
██  ▓▓▓  ██▓▓▓▓██▓▓██▓▓██
██████▓██▓▓▓▓██████▓▓▓▓██
 ██▓▓▓  ██████▀▀▀▀▓▓▓▓▓▓▓

i3 Developer Setup
Modern • Beautiful • Efficient
EOF
echo -e "${NC}"

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

print_header() {
    echo -e "\n${BOLD}${BLUE}$1${NC}"
    echo -e "${BLUE}$(printf '=%.0s' {1..50})${NC}"
}

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

print_header "🚀 i3 Developer Setup Installation"

print_status "Starting installation process..."
print_status "Installation directory: $SCRIPT_DIR"

# Check if running on Arch Linux
if ! command -v pacman &> /dev/null; then
    print_error "This setup is designed for Arch Linux systems"
    print_error "Please ensure you're running Arch Linux or an Arch-based distribution"
    exit 1
fi

print_success "Arch Linux detected"

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    print_error "This script should not be run as root"
    print_error "Please run as a normal user with sudo privileges"
    exit 1
fi

# Check sudo access
if ! sudo -n true 2>/dev/null; then
    print_status "This script requires sudo access for system configuration"
    print_status "You may be prompted for your password"
fi

print_header "📦 Phase 1: Installing Packages"
if [ -f "$SCRIPT_DIR/scripts/install-packages.sh" ]; then
    bash "$SCRIPT_DIR/scripts/install-packages.sh"
else
    print_error "Package installation script not found!"
    exit 1
fi

print_header "⚙️  Phase 2: Installing Configurations"
if [ -f "$SCRIPT_DIR/scripts/install-configs.sh" ]; then
    bash "$SCRIPT_DIR/scripts/install-configs.sh"
else
    print_error "Configuration installation script not found!"
    exit 1
fi

print_header "🎉 Installation Complete!"

echo -e "${GREEN}"
cat << "EOF"
   ✓ All packages installed
   ✓ Configurations applied  
   ✓ SDDM theme installed
   ✓ System services enabled
   ✓ Desktop session created

EOF
echo -e "${NC}"

print_success "i3 Developer Setup installed successfully!"
echo ""
print_status "${BOLD}Next Steps:${NC}"
echo "  1. ${YELLOW}Reboot your system${NC}: reboot"
echo "  2. ${YELLOW}Select 'i3' session${NC} at the login screen"
echo "  3. ${YELLOW}Log in${NC} with your credentials"
echo "  4. ${YELLOW}Press Super+Return${NC} to open terminal"
echo "  5. ${YELLOW}Check keybindings${NC}: cat ~/.config/i3/cheat-sheet.md"
echo ""
print_status "${BOLD}Essential Keybindings:${NC}"
echo "  ${BLUE}Super + Return${NC}     → Terminal"
echo "  ${BLUE}Super + c${NC}          → Code editor (Zed)"
echo "  ${BLUE}Super + Shift + f${NC}  → File manager"
echo "  ${BLUE}Super + d${NC}          → Application launcher"
echo "  ${BLUE}Super + h/j/k/l${NC}    → Navigate windows (vim-style)"
echo ""
print_warning "Some theme changes may require restarting applications"
print_status "Enjoy your new i3 developer environment! 🚀"
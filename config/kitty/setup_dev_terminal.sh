#!/bin/bash
# Developer Terminal Setup Script
# Run this script to install and configure modern terminal tools

set -e

echo "🚀 Setting up developer-friendly terminal environment..."

# Determine package manager
if command -v pacman &> /dev/null; then
    PKG_MANAGER="pacman"
    INSTALL_CMD="sudo pacman -S --needed"
elif command -v apt &> /dev/null; then
    PKG_MANAGER="apt"
    INSTALL_CMD="sudo apt install -y"
elif command -v dnf &> /dev/null; then
    PKG_MANAGER="dnf"
    INSTALL_CMD="sudo dnf install -y"
elif command -v brew &> /dev/null; then
    PKG_MANAGER="brew"
    INSTALL_CMD="brew install"
else
    echo "❌ No supported package manager found!"
    exit 1
fi

echo "📦 Detected package manager: $PKG_MANAGER"

# Install essential tools
echo "🔧 Installing core developer tools..."

case $PKG_MANAGER in
    "pacman")
        $INSTALL_CMD fzf bat exa ripgrep fd zsh starship git-delta
        ;;
    "apt")
        $INSTALL_CMD fzf bat exa ripgrep fd-find zsh curl
        # Install starship manually for apt systems
        if ! command -v starship &> /dev/null; then
            curl -sS https://starship.rs/install.sh | sh -s -- -y
        fi
        ;;
    "dnf")
        $INSTALL_CMD fzf bat exa ripgrep fd-find zsh
        # Install starship manually for dnf systems
        if ! command -v starship &> /dev/null; then
            curl -sS https://starship.rs/install.sh | sh -s -- -y
        fi
        ;;
    "brew")
        $INSTALL_CMD fzf bat exa ripgrep fd zsh starship git-delta
        ;;
esac

# Install zsh-autosuggestions and zsh-syntax-highlighting
echo "🔧 Installing zsh plugins..."
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

# Install Oh My Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "📦 Installing Oh My Zsh..."
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install zsh plugins
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
fi

# Install fzf-tab for better tab completion
if [ ! -d "$ZSH_CUSTOM/plugins/fzf-tab" ]; then
    git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM}/plugins/fzf-tab
fi

echo "✅ All tools installed successfully!"
echo ""
echo "🔧 Configuration files will be created next..."
echo "💡 After setup completes:"
echo "   - Restart your terminal or run 'exec zsh'"
echo "   - Use Ctrl+R for fuzzy command history"
echo "   - Use Ctrl+T for fuzzy file finder"
echo "   - Use Alt+C for fuzzy directory navigation"
echo ""
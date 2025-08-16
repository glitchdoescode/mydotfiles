# 🚀 i3 Developer Setup

A complete, modern i3 window manager configuration optimized for developers. Features a beautiful dark theme, comprehensive application integration, and a streamlined workflow.

![i3 Desktop](screenshots/desktop.png)

## ✨ Features

### 🎨 **Beautiful Dark Theme**
- **Nord-inspired color scheme** with consistent theming
- **SDDM login screen** with custom dark theme
- **GTK/Qt applications** with Materia-dark theme
- **14pt Hack Nerd Font** optimized for 14" laptops
- **High-DPI scaling** (120 DPI) for crisp text

### 🔧 **Developer-Focused**
- **Vim-style navigation** (`Super + h/j/k/l`)
- **Zed editor** as default with comprehensive file associations
- **No application chooser dialogs** - instant file opening
- **Smart workspace organization** with intuitive names
- **Quick access shortcuts** for common development tasks

### 🌍 **International Support**
- **Full emoji support** 🚀💻📁🔥
- **Multi-language fonts** (Chinese, Japanese, Korean, Hindi, Arabic)
- **Comprehensive character coverage** with Noto fonts
- **No missing character boxes** ever again

### ⚡ **Performance Optimized**
- **GPU-accelerated compositor** (picom)
- **Hardware video decoding** for smooth wallpapers
- **Minimal resource usage** 
- **Fast startup times** with optimized configurations

## 📋 What's Included

### **Core Applications**
- **Terminal**: kitty
- **Editor**: Zed
- **Browser**: Firefox
- **File Manager**: Thunar
- **Image Viewer**: feh
- **PDF Viewer**: mupdf
- **Media Player**: mpv

### **System Components**
- **Window Manager**: i3
- **Status Bar**: i3blocks & polybar
- **Display Manager**: SDDM with custom theme
- **Compositor**: picom
- **Notifications**: dunst
- **Application Launcher**: rofi
- **Screenshot**: flameshot

### **Theming**
- **GTK Theme**: Materia-dark
- **Icon Theme**: Papirus-Dark
- **Qt Theme**: Fusion with dark colors
- **Cursor Theme**: Adwaita
- **Font**: Hack Nerd Font 14pt

## 🛠 Installation

### Prerequisites
- **Arch Linux** (or Arch-based distribution)
- **Internet connection** for package downloads
- **sudo privileges** for system configuration

### Quick Install

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/i3-developer-setup.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Install packages** (takes 5-10 minutes)
   ```bash
   ./scripts/install-packages.sh
   ```

3. **Install configurations**
   ```bash
   ./scripts/install-configs.sh
   ```

4. **Reboot and enjoy!**
   ```bash
   reboot
   ```

### Manual Installation

<details>
<summary>Click to expand manual installation steps</summary>

#### Step 1: Install Packages
```bash
# Update system
sudo pacman -Sy

# Install core i3
sudo pacman -S i3-wm i3blocks i3lock rofi

# Install applications
sudo pacman -S kitty zed firefox thunar feh mupdf mpv flameshot

# Install theming
sudo pacman -S sddm picom dunst materia-gtk-theme papirus-icon-theme

# Install fonts
sudo pacman -S ttf-hack-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji
```

#### Step 2: Copy Configurations
```bash
# Copy user configs
cp -r config/i3 ~/.config/
cp -r config/picom ~/.config/
cp -r config/rofi ~/.config/
cp -r config/dunst ~/.config/
cp -r config/fontconfig ~/.config/
cp -r config/gtk-3.0 ~/.config/
cp -r config/qt5ct ~/.config/
cp config/mimeapps.list ~/.config/
cp config/gtkrc-2.0 ~/.gtkrc-2.0

# Install SDDM theme (requires sudo)
sudo cp -r themes/i3-dark /usr/share/sddm/themes/
sudo cp config/sddm/theme.conf /etc/sddm.conf.d/
sudo systemctl enable sddm.service
```

#### Step 3: Create Desktop Session
```bash
sudo tee /usr/share/xsessions/i3.desktop > /dev/null << 'EOF'
[Desktop Entry]
Name=i3
Comment=improved dynamic tiling window manager
Exec=i3
TryExec=i3
Type=Application
Keywords=tiling;wm;windowmanager;
EOF
```

</details>

## 🎮 Usage Guide

### **Essential Keybindings**

| Key Combination | Action |
|----------------|--------|
| `Super + Return` | Open terminal |
| `Super + c` | Open Zed editor |
| `Super + Shift + f` | Open file manager |
| `Super + Shift + w` | Open Firefox |
| `Super + d` | Application launcher |
| `Super + Tab` | Window switcher |

### **Window Management**

| Key Combination | Action |
|----------------|--------|
| `Super + h/j/k/l` | Focus window (vim-style) |
| `Super + Shift + h/j/k/l` | Move window |
| `Super + b` | Split horizontally |
| `Super + v` | Split vertically |
| `Super + f` | Fullscreen toggle |
| `Super + Shift + Space` | Float/unfloat window |

### **Workspaces**

| Workspace | Name | Purpose |
|-----------|------|---------|
| 1 | 🖥️ Terminal | Terminal sessions |
| 2 | 💻 Code | Development work |
| 3 | 🌐 Web | Web browsing |
| 4 | 📁 Files | File management |
| 5 | 🔄 Git | Version control |
| 6 | 🐳 Docker | Containerization |
| 7 | 🗄️ DB | Database work |
| 8 | 💬 Chat | Communication |
| 9 | 🎵 Music | Media playback |
| 10 | 📋 Misc | Everything else |

### **Media Keys**

| Key | Action |
|-----|--------|
| `Volume Up/Down` | Adjust volume |
| `Volume Mute` | Toggle mute |
| `Brightness Up/Down` | Adjust screen brightness |
| `Print Screen` | Screenshot (interactive) |

## 📁 Directory Structure

```
dotfiles/
├── config/                 # Application configurations
│   ├── i3/                # i3 window manager
│   ├── i3blocks/          # Status bar configuration
│   ├── kitty/             # Terminal configuration  
│   ├── polybar/           # Alternative status bar
│   ├── sddm/              # Login screen
│   ├── picom/             # Compositor
│   ├── rofi/              # Application launcher
│   ├── dunst/             # Notifications
│   ├── fontconfig/        # Font configuration
│   ├── gtk-3.0/           # GTK3 theming
│   ├── qt5ct/             # Qt5 theming
│   ├── mimeapps.list      # Default applications
│   └── gtkrc-2.0          # GTK2 theming
├── themes/                # Custom themes
│   └── i3-dark/           # SDDM login theme
├── scripts/               # Installation scripts
│   ├── install-packages.sh
│   └── install-configs.sh
├── docs/                  # Documentation
├── screenshots/           # Preview images
├── packages.txt           # Complete package list
└── README.md             # This file
```

## 🔧 Customization

### **Changing Wallpaper**
1. Replace the video file path in `~/.config/i3/config` line 9
2. Or disable video wallpaper and use static image:
   ```bash
   # Comment out the xwinwrap line and uncomment:
   exec --no-startup-id feh --bg-scale /path/to/your/wallpaper.jpg
   ```

### **Modifying Theme Colors**
Edit the color variables in `~/.config/i3/config`:
```bash
# Developer Color Scheme (Nord-inspired)
set $bg-color            #2f343f
set $inactive-bg-color   #2f343f
set $text-color          #f3f4f5
set $inactive-text-color #676E7D
set $urgent-bg-color     #E53935
set $indicator-color     #00ff00
```

### **Adding Applications**
Update MIME associations in `~/.config/mimeapps.list`:
```ini
[Default Applications]
text/x-python=your-app.desktop
```

## 🐛 Troubleshooting

### **Video Wallpaper Not Working**
1. Check if xwinwrap is installed: `which xwinwrap`
2. Verify video file exists: `ls ~/Media/Videos/`
3. Test mpv separately: `mpv /path/to/video.mp4`

### **Brightness Keys Not Working**
1. Install brightnessctl: `sudo pacman -S brightnessctl`
2. Add user to video group: `sudo usermod -a -G video $USER`
3. Logout and login again

### **Applications Not Opening**
1. Update desktop database: `update-desktop-database ~/.local/share/applications`
2. Clear icon cache: `gtk-update-icon-cache`
3. Restart i3: `Super + Shift + r`

### **Fonts Not Displaying**
1. Rebuild font cache: `fc-cache -fv`
2. Check font installation: `fc-list | grep -i hack`
3. Restart applications

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **i3 community** for the amazing window manager
- **Nord theme** for color inspiration
- **Arch Linux** for the excellent package ecosystem
- **Font developers** for beautiful typography

## 📧 Support

- **GitHub Issues**: For bugs and feature requests
- **Wiki**: For additional documentation
- **Discussions**: For questions and community support

---

**Made with ❤️ for developers who love efficiency and beauty**

*This configuration has been battle-tested in daily development work and optimized for productivity.*
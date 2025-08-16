# i3 Developer Configuration - Keyboard Shortcuts

## Window Management
- `Super + h/j/k/l` - Focus window (vim-style navigation)
- `Super + Shift + h/j/k/l` - Move window
- `Super + b` - Split horizontally
- `Super + v` - Split vertically
- `Super + f` - Fullscreen toggle
- `Super + Shift + Space` - Float/unfloat window
- `Super + Space` - Switch focus between floating/tiled

## Application Shortcuts
- `Super + Return` - Open terminal (kitty)
- `Super + c` - Open Zed editor
- `Super + Shift + f` - Open file manager (thunar)
- `Super + Shift + w` - Open Firefox
- `Super + d` - Application launcher (rofi)
- `Super + Tab` - Window switcher (rofi)
- `Super + grave (`)` - Scratchpad terminal

## Workspaces
- `Super + 1-0` - Switch to workspace 1-10
- `Super + Shift + 1-0` - Move window to workspace

## Workspace Names
1. 🖥️ Terminal
2. 💻 Code  
3. 🌐 Web
4. 📁 Files
5. 🔄 Git
6. 🐳 Docker
7. 🗄️ DB
8. 💬 Chat
9. 🎵 Music
10. 📋 Misc

## Screenshots
- `Print` - Interactive screenshot (flameshot)
- `Super + Print` - Full screen screenshot

## System
- `Super + Shift + c` - Reload i3 config
- `Super + Shift + r` - Restart i3
- `Super + Shift + e` - Exit i3
- `Super + r` - Resize mode

## Volume (Media Keys)
- `XF86AudioRaiseVolume` - Volume up
- `XF86AudioLowerVolume` - Volume down
- `XF86AudioMute` - Mute toggle

## Brightness (Media Keys)
- `XF86MonBrightnessUp` - Brightness up (+10%)
- `XF86MonBrightnessDown` - Brightness down (-10%)

## Color Scheme
Based on Nord theme with developer-friendly colors:
- Background: #2f343f
- Focused: #81A1C1 (blue)
- Text: #f3f4f5 (light)
- Urgent: #E53935 (red)

## Default Applications
- Terminal: kitty
- Editor: Zed
- Browser: Firefox/Chrome
- Image Viewer: feh (no more dialogs!)
- File Manager: thunar
- Notification: dunst

## System-wide Dark Theme
- **GTK Theme**: Materia-dark with Papirus-Dark icons
- **Qt Theme**: Fusion with dark colors
- **SDDM Login**: Custom i3-dark theme with Nord colors
- **Consistent dark appearance** across all applications
- **High-DPI scaling** optimized for 14" laptop

## Features
- 8px inner gaps for modern look
- Nord-inspired color scheme
- Smart borders and gaps
- No automatic application assignment (user choice)
- Floating rules for dialogs
- Compositor effects with picom
- Developer-focused workspace names
- Larger fonts (14pt) optimized for 14" laptops
- Comprehensive international language support
- Full emoji support 🚀💻📁🔥
- Hack Nerd Font with Noto fallbacks

## Font & Language Support
- **Primary Font**: Hack Nerd Font 14pt
- **Emoji Support**: 😀🚀💻📁🌟🔥 (Noto Color Emoji)
- **International Languages**:
  - Chinese: 你好 (Simplified & Traditional)
  - Japanese: こんにちは
  - Korean: 안녕하세요  
  - Hindi: नमस्ते
  - Arabic, Thai, Vietnamese and 100+ more languages
- **System DPI**: 120 DPI for better scaling on 14" displays
- **Font Configuration**: Comprehensive fallback chain ensures no missing characters

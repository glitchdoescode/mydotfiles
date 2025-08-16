# 🌟 Glassmorphism Developer Terminal

*A beautiful, modern, and highly productive terminal setup*

## 📋 What's Included

### 🎨 **Visual**
- **Glassmorphism UI** with 70% transparency and 25px blur
- **Rose Pine Glass** color scheme optimized for coding
- **Modern icons** and beautiful file listings
- **Smart prompt** showing git status, language versions

### 🚀 **Developer Tools**
- **fzf** - Fuzzy finder for everything
- **bat** - Cat with syntax highlighting
- **exa** - Modern ls with icons and git integration
- **ripgrep** - Fast text search
- **fd** - Fast file finder
- **starship** - Beautiful cross-shell prompt
- **git-delta** - Enhanced git diffs

### 🐚 **Shell Features (Zsh)**
- **Auto-suggestions** based on command history
- **Syntax highlighting** while typing
- **Smart tab completion** with previews
- **50,000 command history** with deduplication
- **Fuzzy everything** - files, directories, commands, git branches

## 📚 Documentation

- **[📖 DEVELOPER_HANDBOOK.md](./DEVELOPER_HANDBOOK.md)** - Complete guide with examples
- **[⚡ QUICK_REFERENCE.md](./QUICK_REFERENCE.md)** - Essential shortcuts and commands

## 🚀 Quick Start

### Must-Try Features
1. **Press `Ctrl+R`** - Search your entire command history
2. **Type `ls`** - See beautiful file listings with icons
3. **Use `fcd`** - Navigate directories with fuzzy search
4. **Try `fe`** - Edit files with fuzzy finder
5. **Press `F1-F3`** - Quick access to fuzzy tools

### Essential Commands
```bash
# Fuzzy everything
Ctrl+R          # Command history
Ctrl+T          # File finder
Alt+C           # Directory navigation
fh              # Fuzzy history execute
fcd             # Fuzzy directory change
fe              # Fuzzy file edit

# Modern CLI
ls              # Beautiful file listings (exa)
cat file.js     # Syntax highlighted output (bat)
grep "term"     # Fast search (ripgrep)

# Git shortcuts
gs              # git status
ga .            # git add all
gc -m "msg"     # git commit
gp              # git push
```

## ⚙️ Configuration Files

```
~/.config/kitty/
├── kitty.conf              # Main terminal config
├── glassmorphism.conf      # Glass theme settings
├── setup_dev_terminal.sh   # Setup script
├── DEVELOPER_HANDBOOK.md   # Complete documentation
└── QUICK_REFERENCE.md      # Quick reference

~/.config/starship.toml     # Prompt configuration
~/.zshrc                    # Shell configuration
```

## 🎨 Customization

### Adjust Transparency
```bash
# Edit ~/.config/kitty/glassmorphism.conf
background_opacity 0.70     # 0.1 = very transparent, 1.0 = opaque
background_blur    25       # Blur intensity
```

### Change Colors
```bash
# Edit ~/.config/kitty/kitty.conf
# Modify any color values to your preference
```

### Reload Configuration
```bash
# Press in kitty
Ctrl+Shift+F5
```

## 🔧 Maintenance

### Update Tools
```bash
# Run setup script again to update
~/.config/kitty/setup_dev_terminal.sh
```

### Reset Configuration
```bash
# Backup and reset if needed
cp ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.backup
# Then re-run setup script
```

## 💡 Pro Tips

1. **Master `Ctrl+R`** - It's the most powerful feature
2. **Use fuzzy functions** - `fcd`, `fe`, `fh` will speed up your workflow
3. **Customize transparency** - Find your perfect balance
4. **Learn the git shortcuts** - `gs`, `ga`, `gc`, `gp` for rapid git workflows
5. **Use tabs effectively** - `Ctrl+Shift+T` for multiple contexts

## 🆘 Troubleshooting

### Common Issues
- **Transparency not working?** Check desktop compositor settings
- **Icons not showing?** Install FiraCode Nerd Font
- **Fuzzy finder issues?** Run setup script again
- **Performance problems?** Reduce blur or transparency

### Get Help
```bash
# Show all features
~/.config/kitty/demo_features.sh

# Read full documentation
cat ~/.config/kitty/DEVELOPER_HANDBOOK.md

# Quick reference
cat ~/.config/kitty/QUICK_REFERENCE.md
```

---

## 🌟 Enjoy Your Beautiful, Productive Terminal!

This setup transforms your terminal into a modern, efficient development environment. The glassmorphism design makes it beautiful, while the modern tools and fuzzy finding make you incredibly productive.

**Happy coding!** ✨
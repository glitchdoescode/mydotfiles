# 🌟 Glassmorphism Developer Terminal Handbook

*Your complete guide to the modern, beautiful, and productive terminal setup*

---

## 📚 Table of Contents

1. [Visual Overview](#visual-overview)
2. [Quick Start](#quick-start)
3. [Fuzzy Finding Mastery](#fuzzy-finding-mastery)
4. [Modern CLI Tools](#modern-cli-tools)
5. [Kitty Shortcuts](#kitty-shortcuts)
6. [Shell Features (Zsh)](#shell-features-zsh)
7. [Git Integration](#git-integration)
8. [Customization](#customization)
9. [Troubleshooting](#troubleshooting)
10. [Pro Tips](#pro-tips)

---

## 🎨 Visual Overview

### What You Now Have
- **Glassmorphism UI**: 70% transparency with 25px blur for that modern glass effect
- **Rose Pine Glass Theme**: Beautiful color scheme optimized for coding
- **Starship Prompt**: Smart prompt showing git status, language versions, and more
- **Modern CLI Tools**: Enhanced versions of common commands with better UX
- **Fuzzy Everything**: Search through files, commands, and directories instantly

### Key Visual Elements
```
┌─ Translucent Window Border (Glass Blue)
│  ┌─ Tab Bar with Glass Effect
│  │   Active Tab │ Inactive Tab │ Another Tab
│  └─────────────────────────────────────────
│   
│   ~/project ❯ git status                    ← Starship Prompt
│   On branch main ✓                         ← Git Status
│   
│   ~/project ❯ ls                           ← Modern ls (exa)
│   📁 src/     📄 README.md    🔧 package.json
│   
└─────────────────────────────────────────────
```

---

## 🚀 Quick Start

### Essential First Steps
1. **Reload Configuration**: `Ctrl+Shift+F5`
2. **Test Fuzzy Search**: `Ctrl+R` then type anything
3. **Try Modern ls**: Type `ls` (now using exa with icons)
4. **Check Git Status**: `gs` (shortcut for git status)

### Immediate Productivity Gains
- **Never lose a command**: `Ctrl+R` searches your entire history
- **Navigate faster**: `fcd` for fuzzy directory jumping
- **Edit files quickly**: `fe` for fuzzy file editing
- **Beautiful file listings**: `ls` now shows icons and git status

---

## 🔍 Fuzzy Finding Mastery

### Core Fuzzy Commands

#### `Ctrl+R` - Command History Search
```bash
# Press Ctrl+R, then type partial command
# Example: Type "docker" to find all docker commands you've used
```

#### `Ctrl+T` - File Finder
```bash
# Press Ctrl+T to search for files in current directory
# Use with any command: vim [Ctrl+T]
```

#### `Alt+C` - Directory Navigation
```bash
# Press Alt+C to fuzzy search and cd to directories
```

### Custom Fuzzy Functions

#### `fh` - Fuzzy History Execute
```bash
fh                    # Search and execute from history
fh docker             # Search history for docker commands
```

#### `fcd` - Fuzzy Directory Change
```bash
fcd                   # Search all directories from current location
fcd ~/projects        # Search directories starting from ~/projects
```

#### `fe` - Fuzzy File Edit
```bash
fe                    # Search and edit files
fe .js                # Search only JavaScript files
```

#### `fkill` - Fuzzy Process Kill
```bash
fkill                 # Interactive process killer with search
```

#### `fgco` - Fuzzy Git Checkout
```bash
fgco                  # Fuzzy search and checkout git branches
```

### Fuzzy Search Tips
- **Multi-select**: Use `Tab` to select multiple items
- **Preview**: Most searches show file/command previews
- **Exact match**: Use `'exact` for exact matching
- **Exclude**: Use `!term` to exclude terms
- **AND search**: Use spaces: `docker run nginx`

---

## 🛠️ Modern CLI Tools

### Enhanced File Operations

#### `ls` → `exa` (with icons and git status)
```bash
ls                    # Basic listing with icons
ll                    # Long format with git status
la                    # All files including hidden
lt                    # Tree view
l                     # Compact view
```

#### `cat` → `bat` (syntax highlighting)
```bash
cat file.js           # Shows with syntax highlighting
bat file.py           # Same as cat, but better
less large_file.log   # Paginated with syntax highlighting
```

#### `grep` → `ripgrep` (faster searching)
```bash
grep "function"       # Search in current directory
rg "TODO" --type js   # Search only in JavaScript files
rg -i "error"         # Case insensitive search
```

#### `find` → `fd` (simpler and faster)
```bash
# Old way: find . -name "*.js" -type f
fd "\.js$"            # Find all JavaScript files
fd --type f --size +1m # Files larger than 1MB
```

### File Content Tools

#### Syntax Highlighting
```bash
bat config.json       # JSON with syntax highlighting
bat script.py         # Python with line numbers
bat --theme="base16"  # Different color theme
```

#### Advanced Search
```bash
rg "import.*react" --type tsx    # Search in TypeScript React files
rg -C 3 "error"                  # Show 3 lines context
rg --files-with-matches "TODO"   # Only show filenames
```

---

## ⌨️ Kitty Shortcuts

### Developer Shortcuts
| Shortcut | Action | Description |
|----------|--------|-------------|
| `F1` | Quick Fuzzy History | Opens fuzzy command history in new tab |
| `F2` | Quick Directory Nav | Opens fuzzy directory navigation |
| `F3` | Quick File Edit | Opens fuzzy file editor |
| `Ctrl+Shift+G` | Git Status | Quick git status in new tab |

### Window Management
| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+T` | New tab |
| `Ctrl+Shift+W` | Close tab |
| `Ctrl+Shift+Enter` | New window |
| `Ctrl+Shift+N` | New OS window |

### Navigation
| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+Right/Left` | Next/Previous tab |
| `Ctrl+Shift+H/L` | Navigate windows horizontally |
| `Ctrl+Shift+K/J` | Navigate windows vertically |

### Visual Adjustments
| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift++` | Increase font size |
| `Ctrl+Shift+-` | Decrease font size |
| `Ctrl+Shift+0` | Reset font size |
| `Ctrl+Shift+F5` | Reload configuration |

### Advanced Features
| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+F` | Search terminal scrollback |
| `Ctrl+Shift+E` | Hint URLs (click to open) |
| `Ctrl+Shift+P` | Hint file paths |
| `Ctrl+Shift+C/V` | Copy/Paste |

---

## 🐚 Shell Features (Zsh)

### Auto-completion & Suggestions
- **Auto-suggestions**: Type and see suggestions based on history
- **Tab completion**: Enhanced fuzzy tab completion
- **Case-insensitive**: Completions work regardless of case

### History Management
```bash
# 50,000 command history with smart deduplication
history                # Show recent commands
!!                     # Execute last command  
!n                     # Execute command number n
!string                # Execute last command starting with string
```

### Key Bindings
| Keys | Action |
|------|--------|
| `↑/↓` | History substring search |
| `Ctrl+R` | Fuzzy history search |
| `Ctrl+S` | Forward search enabled |
| `Tab` | Fuzzy completion |

### Smart Aliases

#### Git Shortcuts
```bash
g       # git
gs      # git status
ga      # git add
gc      # git commit
gp      # git push
gl      # git pull
gd      # git diff
gb      # git branch
gco     # git checkout
gcb     # git checkout -b
glog    # git log --oneline --graph --decorate
```

#### Navigation Shortcuts
```bash
mkcd dirname    # Create directory and cd into it
..              # Go up one directory
...             # Go up two directories
```

---

## 🔧 Git Integration

### Starship Git Indicators
```bash
~/project on 🌱 main [!?] ❯    # On main branch with changes
~/project on 🌱 feature ↑3 ❯   # Ahead by 3 commits
~/project on 🌱 main ✓ ❯       # Clean working directory
```

### Git Status Symbols
- `✓` - Clean working directory
- `!` - Modified files
- `?` - Untracked files
- `+` - Staged files
- `↑n` - Ahead by n commits
- `↓n` - Behind by n commits

### Enhanced Git Diff (git-delta)
```bash
git diff              # Beautiful side-by-side diff
git log -p            # Log with enhanced diffs
git show commit_hash  # Show commit with syntax highlighting
```

### Fuzzy Git Workflows
```bash
fgco                  # Fuzzy checkout branch
ga .                  # Add all files
gc -m "message"       # Commit with message
gp                    # Push to remote
```

---

## 🎨 Customization

### Adjust Transparency
Edit `~/.config/kitty/glassmorphism.conf`:
```conf
background_opacity          0.70    # 0.1 (very transparent) to 1.0 (opaque)
background_blur             25      # Blur intensity (0-50)
```

### Change Colors
Main color scheme in `~/.config/kitty/kitty.conf`:
```conf
# Customize any color
foreground              #f8f8f2    # Text color
background              #0d1117    # Background color
cursor                  #f8f8f0    # Cursor color
```

### Starship Prompt Customization
Edit `~/.config/starship.toml`:
```toml
[character]
success_symbol = '[➜](bold green)'    # Change prompt symbol
error_symbol = '[➜](bold red)'

[git_branch]
symbol = '🚀 '                        # Change git branch symbol
```

### Font Configuration
```conf
font_family             FiraCode Nerd Font
font_size               12.0
```

### Add Custom Aliases
Edit `~/.zshrc` and add:
```bash
alias mycommand='echo "Hello World"'
alias work='cd ~/projects && ls'
```

---

## 🔧 Troubleshooting

### Common Issues

#### "Command not found" after setup
```bash
# Reload shell configuration
source ~/.zshrc
# Or restart terminal
```

#### Fuzzy finder not working
```bash
# Check if fzf is installed
fzf --version
# Reinstall key bindings
~/.config/kitty/setup_dev_terminal.sh
```

#### Transparency not working
- Check if your desktop compositor supports blur effects
- Try adjusting `background_opacity` to a higher value
- Some desktop environments need specific settings for transparency

#### Starship prompt not showing
```bash
# Check if starship is installed
starship --version
# Reinitialize
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
```

#### Icons not displaying
- Install a Nerd Font (recommended: FiraCode Nerd Font)
- Update font configuration in kitty.conf
- Restart terminal

### Reset Configuration
```bash
# Backup current config
cp ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.backup

# Restore defaults
rm ~/.config/kitty/kitty.conf
# Run setup again
~/.config/kitty/setup_dev_terminal.sh
```

### Performance Issues
```bash
# Reduce blur for better performance
# Edit ~/.config/kitty/glassmorphism.conf
background_blur             10      # Reduce from 25

# Or disable transparency temporarily
background_opacity          1.0
```

---

## 💡 Pro Tips

### Workflow Optimizations

#### Project Navigation
```bash
# Create project shortcuts
alias myapp='cd ~/projects/my-app && ls'
alias api='cd ~/projects/api && git status'

# Use zoxide for smart directory jumping
z myproject               # Jump to frequently used directories
```

#### Multi-tasking
```bash
# Use tabs for different contexts
Ctrl+Shift+T              # New tab for different task
F1                        # Quick command search in new tab
F2                        # Quick directory nav in new tab
```

#### Development Workflow
```bash
# Terminal 1: Main development
fe                        # Edit files with fuzzy finder

# Terminal 2: Git operations  
gs && ga . && gc -m "fix"  # Quick git workflow

# Terminal 3: Testing/Running
npm test                  # Keep tests running
```

### Advanced Fuzzy Usage

#### Complex Searches
```bash
# Search for specific file types
fe --type js              # Only JavaScript files
fcd src/                  # Only directories under src/

# Chain fuzzy operations
fcd && fe                 # Navigate to directory, then edit file
```

#### Custom FZF Options
```bash
# In ~/.zshrc, customize FZF behavior
export FZF_DEFAULT_OPTS="--height 60% --layout=reverse --border"
```

### Keyboard Efficiency

#### Command Composition
```bash
# Build complex commands with fuzzy selection
docker exec -it $(docker ps | fzf | awk '{print $1}') bash
```

#### Quick File Operations
```bash
# Edit configuration files quickly
alias kconf='nano ~/.config/kitty/kitty.conf'
alias zconf='nano ~/.zshrc'
alias sconf='nano ~/.config/starship.toml'
```

### Terminal Multiplexing
```bash
# Use kitty's window management instead of tmux
Ctrl+Shift+Enter          # Split into new window
Ctrl+Shift+H/L            # Navigate between splits
```

### Developer Shortcuts You'll Love
```bash
# Quick server start
alias serve='python -m http.server 8000'
alias liveserver='live-server --port=3000'

# Project initialization  
alias gitinit='git init && git add . && git commit -m "Initial commit"'

# Quick file previews
alias preview='fzf --preview="bat --color=always {}"'
```

---

## 📖 Reference Quick Cards

### Fuzzy Commands Cheat Sheet
```
fh        → Fuzzy command history
fcd       → Fuzzy directory change  
fe        → Fuzzy file edit
fkill     → Fuzzy process kill
fgco      → Fuzzy git branch checkout

Ctrl+R    → Command history search
Ctrl+T    → File finder
Alt+C     → Directory navigation
```

### Git Aliases Quick Reference
```
g         → git
gs        → git status
ga        → git add
gc        → git commit
gp        → git push
gl        → git pull
gd        → git diff
gb        → git branch
gco       → git checkout
glog      → git log --oneline --graph
```

### Modern CLI Tools
```
ls        → exa (icons + git status)
cat       → bat (syntax highlighting)
grep      → ripgrep (faster search)
find      → fd (simpler syntax)
```

---

## 🎯 Conclusion

You now have a **state-of-the-art terminal environment** that combines:

- **Beautiful glassmorphism aesthetics** for a modern look
- **Powerful fuzzy finding** for instant access to everything
- **Modern CLI tools** that enhance every operation
- **Smart shell features** that learn from your usage
- **Efficient shortcuts** for common developer tasks

### Next Steps
1. **Practice the fuzzy commands** - They'll become second nature
2. **Customize colors and transparency** to your liking
3. **Add your own aliases** for project-specific workflows
4. **Share this setup** with your team for consistency

### Get Help
- Run `~/.config/kitty/demo_features.sh` for a feature overview
- Check `~/.config/kitty/` for all configuration files
- Use `man fzf` for advanced fuzzy finder options

**Happy coding with your beautiful, productive terminal!** ✨

---

*Glassmorphism developer terminal setup*
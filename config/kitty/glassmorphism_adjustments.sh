#!/bin/bash
# Glassmorphism Terminal Adjustments
# Run this to fine-tune the glassmorphism effect

echo "🌟 Applying glassmorphism adjustments..."

# Create a custom kitty theme file for easier management
cat > ~/.config/kitty/glassmorphism.conf << 'EOF'
# ========================================
# Glassmorphism Theme for Kitty Terminal
# ========================================

# Ultra-translucent background with strong blur
background_opacity          0.70
background_blur             25
dynamic_background_opacity  yes

# Glassmorphism color palette
foreground                  #f8f8f2
background                  #0d1117
selection_foreground        #000000
selection_background        #44475a80
url_color                   #8be9fd
cursor                      #f8f8f0
cursor_text_color           #0d1117

# Enhanced glass colors with subtle transparency effects
color0                      #21222c
color1                      #ff79c6
color2                      #50fa7b
color3                      #f1fa8c
color4                      #8be9fd
color5                      #bd93f9
color6                      #8be9fd
color7                      #f8f8f2
color8                      #6272a4
color9                      #ff92d0
color10                     #69ff94
color11                     #ffffa5
color12                     #9aedfe
color13                     #d0a9ff
color14                     #a4ffff
color15                     #ffffff

# Glassmorphism window styling
active_border_color         #8be9fd80
inactive_border_color       #6272a460
window_border_width         2px
window_padding_width        12

# Tab styling with glass effect
active_tab_foreground       #0d1117
active_tab_background       #8be9fd90
inactive_tab_foreground     #f8f8f2
inactive_tab_background     #21222c60
tab_separator               " ◆ "
EOF

# Add include directive to main config if not present
if ! grep -q "include glassmorphism.conf" ~/.config/kitty/kitty.conf; then
    echo "" >> ~/.config/kitty/kitty.conf
    echo "# Include glassmorphism theme" >> ~/.config/kitty/kitty.conf
    echo "include glassmorphism.conf" >> ~/.config/kitty/kitty.conf
fi

echo "✨ Glassmorphism theme applied!"
echo "🔧 You can adjust transparency by changing 'background_opacity' in ~/.config/kitty/glassmorphism.conf"
echo "🌈 Reload kitty with Ctrl+Shift+F5 to see changes"
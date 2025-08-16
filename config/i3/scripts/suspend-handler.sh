#!/bin/bash

# Automated suspend/resume handler for i3
# Prevents lock screen issues and ensures proper wake-up

# Pre-suspend cleanup
pre_suspend() {
    # Kill any existing lock processes
    pkill i3lock 2>/dev/null
    
    # Sync filesystem
    sync
    
    # Save current brightness
    brightnessctl get > /tmp/brightness_backup 2>/dev/null || echo "100" > /tmp/brightness_backup
}

# Post-resume recovery
post_resume() {
    # Wait for system to stabilize
    sleep 2
    
    # Restore brightness
    if [ -f /tmp/brightness_backup ]; then
        brightnessctl set $(cat /tmp/brightness_backup) 2>/dev/null
    fi
    
    # Restart any crashed services
    systemctl --user restart pulseaudio 2>/dev/null || true
    
    # Refresh network
    nmcli networking off && nmcli networking on 2>/dev/null || true
    
    # Unlock if stuck
    timeout 5 bash -c 'while pgrep i3lock > /dev/null; do pkill i3lock; sleep 1; done' &
}

# Handle based on action
case "$1" in
    pre)
        pre_suspend
        ;;
    post)
        post_resume
        ;;
    *)
        echo "Usage: $0 {pre|post}"
        exit 1
        ;;
esac
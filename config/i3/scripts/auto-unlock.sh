#!/bin/bash

# Automated unlock system for stuck lock screens
# Runs as a background service to detect and fix lock issues

while true; do
    # Check if we're stuck in lock screen for more than 30 seconds
    if pgrep i3lock > /dev/null; then
        LOCK_PID=$(pgrep i3lock)
        LOCK_TIME=$(ps -o etimes= -p $LOCK_PID 2>/dev/null | tr -d ' ')
        
        # If lock has been running for more than 30 seconds and no input activity
        if [ "$LOCK_TIME" -gt 30 ]; then
            # Check if there's been recent keyboard/mouse activity
            IDLE_TIME=$(xprintidle 2>/dev/null || echo "0")
            
            # If system is idle for more than 30 seconds while locked, likely stuck
            if [ "$IDLE_TIME" -gt 30000 ]; then
                echo "$(date): Detected stuck lock screen, attempting recovery..."
                
                # Try graceful unlock first
                pkill -TERM i3lock
                sleep 2
                
                # Force kill if still running
                if pgrep i3lock > /dev/null; then
                    pkill -KILL i3lock
                    echo "$(date): Force killed stuck i3lock process"
                fi
                
                # Restart display manager if needed
                if ! pgrep i3 > /dev/null; then
                    systemctl --user restart i3 2>/dev/null || true
                fi
            fi
        fi
    fi
    
    # Check every 10 seconds
    sleep 10
done
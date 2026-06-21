#!/usr/bin/env bash
# Rofi Wi-Fi menu: scan, pick, connect (prompts for password when needed),
# plus toggle Wi-Fi on/off. Uses NetworkManager (nmcli) + rofi.

rofi_cmd() { rofi -dmenu -i -theme-str 'window {width: 600px;}' "$@"; }

# Wi-Fi radio state + enable/disable toggle entry
wifi_state=$(nmcli -t -f WIFI g 2>/dev/null)
if [ "$wifi_state" = "enabled" ]; then
    toggle="󰖪  Disable Wi-Fi"
else
    toggle="󰖩  Enable Wi-Fi"
    chosen=$(printf '%s\n' "$toggle" | rofi_cmd -p "Wi-Fi")
    [ -n "$chosen" ] && nmcli radio wifi on
    exit 0
fi

# Rescan and build the network list (signal + SSID + lock for secured)
nmcli -t dev wifi rescan 2>/dev/null
list=$(nmcli --field IN-USE,SIGNAL,SECURITY,SSID -t dev wifi list 2>/dev/null \
    | awk -F: '$4!=""{ mark=($1=="*")?"󰸞 ":"  "; lock=($3=="")?"":" "; printf "%s%s%% %s%s\n",mark,$2,$4,lock }' \
    | sort -t'%' -k1 -rn | sed 's/%/% /' )

chosen=$(printf '%s\n%s\n' "$toggle" "$list" | rofi_cmd -p "Wi-Fi")
[ -z "$chosen" ] && exit 0

if [ "$chosen" = "$toggle" ]; then
    nmcli radio wifi off
    exit 0
fi

# Strip our prefixes/markers to get the bare SSID
ssid=$(echo "$chosen" | sed -E 's/^(󰸞|[[:space:]])+//; s/^[0-9]+%[[:space:]]+//; s/[[:space:]]*$//')

# Already have a saved connection? bring it up; else connect (ask password if secured)
if nmcli -t -f NAME connection show | grep -qxF "$ssid"; then
    nmcli connection up id "$ssid"
elif echo "$chosen" | grep -q ''; then
    pass=$(printf '' | rofi -dmenu -password -p "Password for $ssid")
    nmcli dev wifi connect "$ssid" password "$pass"
else
    nmcli dev wifi connect "$ssid"
fi

# Notify result
if [ $? -eq 0 ]; then
    notify-send -t 2500 "Wi-Fi" "Connected to $ssid" 2>/dev/null
else
    notify-send -t 2500 -u critical "Wi-Fi" "Failed to connect to $ssid" 2>/dev/null
fi

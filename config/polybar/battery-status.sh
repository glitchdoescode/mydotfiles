#!/bin/bash

# Battery status for polybar — reads sysfs directly (no acpi dependency)

BAT=$(ls -d /sys/class/power_supply/BAT* 2>/dev/null | head -1)

if [[ -z "$BAT" ]]; then
    echo "No battery"
    exit 0
fi

percent=$(cat "$BAT/capacity" 2>/dev/null)
status=$(cat "$BAT/status" 2>/dev/null)

if [[ -z "$percent" ]]; then
    echo "Battery: N/A"
    exit 1
fi

# Nerd Font / Font Awesome battery icons (\u escapes render at runtime)
if [[ "$status" == "Charging" || "$status" == "Full" ]]; then
    icon=$''   # plug
elif (( percent >= 90 )); then
    icon=$''   # battery-full
elif (( percent >= 60 )); then
    icon=$''   # three-quarters
elif (( percent >= 40 )); then
    icon=$''   # half
elif (( percent >= 20 )); then
    icon=$''   # quarter
else
    icon=$''   # empty
fi

echo "$icon $percent% ($status)"

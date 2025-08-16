#!/bin/bash

acpi_out=$(acpi -b)

if [[ -z "$acpi_out" ]]; then
    echo "Battery: N/A"
    exit 1
fi

status=$(echo "$acpi_out" | cut -d: -f2 | cut -d, -f1 | xargs)
percent=$(echo "$acpi_out" | grep -o '[0-9]\+%' | tr -d '%')
time_remaining=$(echo "$acpi_out" | awk -F', ' '{print $3}')

# Choose icon based on percentage
if [[ $status == "Charging" ]]; then
    icon=""
elif (( percent >= 90 )); then
    icon=""
elif (( percent >= 60 )); then
    icon=""
elif (( percent >= 40 )); then
    icon=""
elif (( percent >= 20 )); then
    icon=""
else
    icon=""
fi

# Format output
if [[ -z "$time_remaining" ]]; then
    echo "$icon $percent% ($status)"
else
    echo "$icon $percent% ($status, $time_remaining)"
fi


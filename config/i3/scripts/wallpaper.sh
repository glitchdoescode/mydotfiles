#!/bin/bash
# Cycle through wallpapers in ~/Pictures/wallpaper and set them with feh.
#   wallpaper.sh           -> set the last-used wallpaper (startup persistence)
#   wallpaper.sh next      -> next image
#   wallpaper.sh prev      -> previous image
#   wallpaper.sh random    -> random image

WALL_DIR="$HOME/Pictures/wallpaper"
STATE="$HOME/.cache/current_wallpaper"
FALLBACK="$HOME/.config/wallpaper.jpg"
mkdir -p "$(dirname "$STATE")"

# Collect images (sorted for stable next/prev order)
mapfile -t imgs < <(find "$WALL_DIR" -maxdepth 1 -type f \
    \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) 2>/dev/null | sort)

# No wallpapers in the folder: fall back to the shipped default
if [ ${#imgs[@]} -eq 0 ]; then
    [ -f "$FALLBACK" ] && feh --bg-fill "$FALLBACK"
    exit 0
fi

# Find the index of the currently-set wallpaper
cur="$(cat "$STATE" 2>/dev/null)"
idx=0
for i in "${!imgs[@]}"; do
    [ "${imgs[$i]}" = "$cur" ] && idx=$i && break
done

case "$1" in
    next)   idx=$(( (idx + 1) % ${#imgs[@]} )) ;;
    prev)   idx=$(( (idx - 1 + ${#imgs[@]}) % ${#imgs[@]} )) ;;
    random) idx=$(( RANDOM % ${#imgs[@]} )) ;;
    *)      : ;;  # no arg: re-apply the saved current (or first)
esac

img="${imgs[$idx]}"
feh --bg-fill "$img"
echo "$img" > "$STATE"
command -v notify-send >/dev/null && \
    notify-send -t 1500 "Wallpaper" "$(basename "$img")  ($((idx + 1))/${#imgs[@]})"

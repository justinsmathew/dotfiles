#!/bin/bash

# Now-playing via AppleScript polling (MediaRemote-based events are
# unreliable on recent macOS). Checks Spotify first, then Apple Music;
# hides the item when nothing is playing.

for app in "Spotify" "Music"; do
  pgrep -xq "$app" || continue
  STATE=$(osascript -e "tell application \"$app\" to player state as string" 2>/dev/null)
  if [ "$STATE" = "playing" ]; then
    ARTIST=$(osascript -e "tell application \"$app\" to artist of current track" 2>/dev/null)
    TRACK=$(osascript -e "tell application \"$app\" to name of current track" 2>/dev/null)
    if [ -n "$TRACK" ]; then
      sketchybar --set "$NAME" drawing=on label="$ARTIST – $TRACK"
      exit 0
    fi
  fi
done

sketchybar --set "$NAME" drawing=off

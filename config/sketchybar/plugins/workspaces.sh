#!/bin/bash

# Batch-update all workspace items: show only occupied workspaces plus the
# focused one; focused gets a cyan pill, occupied-unfocused a dimmed number.

source "$HOME/.config/sketchybar/colors.sh"

command -v aerospace &>/dev/null || exit 0

FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}"
OCCUPIED=" $(aerospace list-workspaces --monitor all --empty no | tr '\n' ' ') "

args=()
for i in {1..9}; do
  if [ "$i" = "$FOCUSED" ]; then
    args+=(--set space.$i drawing=on
           icon.color=$DARK
           background.drawing=on
           background.color=$CYAN)
  elif [[ "$OCCUPIED" == *" $i "* ]]; then
    args+=(--set space.$i drawing=on
           icon.color=$COMMENT
           background.drawing=off)
  else
    args+=(--set space.$i drawing=off)
  fi
done

sketchybar "${args[@]}"

#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

sketchybar --set $NAME icon="$ICON_CLOCK" \
                        icon.color=$PINK \
                        label="$(date '+%a %d %b %H:%M')" \
                        label.color=$FG

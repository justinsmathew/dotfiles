#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

CPU_USAGE=$(top -l 2 -n 0 -F | grep "CPU usage:" | tail -1 | awk '{print int($3)}')

sketchybar --set $NAME icon="$ICON_CPU" \
                        icon.color=$BLUE \
                        label="${CPU_USAGE}%" \
                        label.color=$FG

#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

MEMORY=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{print 100-int($5)}')

sketchybar --set $NAME icon="$ICON_MEMORY" \
                        icon.color=$GREEN \
                        label="${MEMORY}%" \
                        label.color=$FG

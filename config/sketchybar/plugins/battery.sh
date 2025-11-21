#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

BATTERY=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [[ $CHARGING != "" ]]; then
    ICON="$ICON_BATTERY_CHARGING"
    ICON_COLOR=$GREEN
else
    ICON="$ICON_BATTERY"
    if [ "$BATTERY" -lt 20 ]; then
        ICON_COLOR=$RED
    elif [ "$BATTERY" -lt 50 ]; then
        ICON_COLOR=$YELLOW
    else
        ICON_COLOR=$GREEN
    fi
fi

sketchybar --set $NAME icon="$ICON" \
                        icon.color=$ICON_COLOR \
                        label="${BATTERY}%" \
                        label.color=$FG

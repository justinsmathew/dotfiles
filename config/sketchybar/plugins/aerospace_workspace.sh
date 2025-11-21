#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

# Get workspace number from item name
WORKSPACE=${NAME#*.}

# Check if this is the currently focused workspace
if command -v aerospace &> /dev/null; then
    FOCUSED=$(aerospace list-workspaces --focused)

    # Get the first app in the workspace
    APP_NAME=$(aerospace list-windows --workspace $WORKSPACE --format '%{app-name}' 2>/dev/null | head -1)

    # Check if workspace has windows
    WINDOWS=$(aerospace list-windows --workspace $WORKSPACE 2>/dev/null | wc -l | tr -d ' ')

    # Handle click events
    if [ "$SENDER" = "mouse.clicked" ]; then
        aerospace workspace $WORKSPACE
    fi

    # Get app icon if there's an app in this workspace
    if [ -n "$APP_NAME" ]; then
        APP_ICON=$(get_app_icon "$APP_NAME")
        LABEL_TEXT="$APP_ICON"
    else
        LABEL_TEXT=""
    fi

    # Set appearance based on state
    if [ "$WORKSPACE" = "$FOCUSED" ]; then
        # Focused workspace - highlighted
        sketchybar --set $NAME \
                   icon="$WORKSPACE" \
                   label="$LABEL_TEXT" \
                   label.drawing=on \
                   background.drawing=on \
                   icon.drawing=on \
                   background.color=$MAUVE \
                   icon.color=$BASE \
                   label.color=$BASE \
                   background.border_color=$FG
    elif [ "$WINDOWS" -gt 0 ]; then
        # Workspace with windows but not focused - subtle appearance
        sketchybar --set $NAME \
                   icon="$WORKSPACE" \
                   label="$LABEL_TEXT" \
                   label.drawing=on \
                   background.drawing=on \
                   icon.drawing=on \
                   background.color=$SURFACE0 \
                   icon.color=$OVERLAY1 \
                   label.color=$OVERLAY1 \
                   background.border_color=$SURFACE1
    else
        # Empty workspace - hide completely
        sketchybar --set $NAME \
                   background.drawing=off \
                   icon.drawing=off \
                   label.drawing=off
    fi
fi

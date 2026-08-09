#!/bin/bash

source "$HOME/.config/sketchybar/icons.sh"

if [ "$SENDER" = "front_app_switched" ]; then
  APP="$INFO"
else
  # Initial/forced runs don't carry $INFO — query the frontmost app.
  APP=$(lsappinfo info -only name "$(lsappinfo front)" 2>/dev/null | cut -d'"' -f4)
fi

[ -n "$APP" ] && sketchybar --set "$NAME" icon="$(get_app_icon "$APP")" label="$APP"

#!/bin/sh

# Wi-Fi / network status for SketchyBar (mirrors the waybar network module).

# Find the Wi-Fi interface (usually en0 on Apple Silicon laptops).
WIFI_IF=$(networksetup -listallhardwareports 2>/dev/null | awk '/Wi-Fi|AirPort/{getline; print $2; exit}')
[ -z "$WIFI_IF" ] && WIFI_IF="en0"

IP=$(ipconfig getifaddr "$WIFI_IF" 2>/dev/null)

if [ -n "$IP" ]; then
  SSID=$(networksetup -getairportnetwork "$WIFI_IF" 2>/dev/null | sed -E 's/^Current Wi-Fi Network: //')
  case "$SSID" in
    *"not associated"*|*"not currently"*|"") SSID="Wi-Fi" ;;
  esac
  ICON="󰖩"
  LABEL="$SSID"
else
  ICON="󰖪"
  LABEL="Off"
fi

sketchybar --set "$NAME" icon="$ICON" label="$LABEL"

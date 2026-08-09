#!/bin/bash

# Nerd Font Icons
export ICON_WORKSPACE="󰧨"
export ICON_CPU="󰻠"
export ICON_MEMORY="󰍛"
export ICON_BATTERY="󰁹"
export ICON_BATTERY_CHARGING="󰂄"
export ICON_CLOCK="󰥔"
export ICON_CALENDAR="󰃭"
export ICON_NETWORK="󰖩"
export ICON_VOLUME="󰕾"
export ICON_MUTE="󰖁"

# App Icons - Map common app names to their Nerd Font icons
get_app_icon() {
    case "$1" in
        # Terminals (using laptop/terminal icons)
        "Ghostty"|"ghostty") echo "" ;;
        "WezTerm"|"Wezterm"|"wezterm") echo "" ;;
        "iTerm2"|"iTerm") echo "" ;;
        "Alacritty") echo "" ;;
        "kitty"|"Kitty") echo "" ;;
        "Terminal") echo "" ;;

        # Browsers
        "Safari"|"Safari Technology Preview") echo "󰀹" ;;
        "Google Chrome"|"Chrome") echo "" ;;
        "Firefox"|"Firefox Developer Edition") echo "" ;;
        "Zen"|"Zen Browser") echo "" ;;
        "Arc") echo "󰞍" ;;
        "Brave Browser"|"Brave") echo "󰖟" ;;
        "Microsoft Edge"|"Edge") echo "󰇩" ;;

        # Code Editors
        "Visual Studio Code"|"Code"|"VSCode") echo "󰨞" ;;
        "Cursor") echo "󰨞" ;;
        "Xcode") echo "" ;;
        "IntelliJ IDEA"|"IntelliJ") echo "" ;;
        "PyCharm") echo "" ;;
        "WebStorm") echo "" ;;
        "Sublime Text") echo "" ;;
        "Neovim"|"nvim"|"vim") echo "" ;;

        # Communication
        "Slack") echo "󰒱" ;;
        "Discord") echo "󰙯" ;;
        "Telegram") echo "" ;;
        "Messages"|"iMessage") echo "󰍦" ;;
        "Mail"|"Apple Mail") echo "󰇰" ;;
        "Zoom"|"zoom.us") echo "󰊝" ;;
        "Microsoft Teams"|"Teams") echo "󰊻" ;;

        # Productivity
        "Notion") echo "󰈙" ;;
        "Obsidian") echo "󱞁" ;;
        "Notes"|"Apple Notes") echo "󱞂" ;;
        "Calendar") echo "󰃭" ;;
        "Reminders") echo "󰄲" ;;

        # Media
        "Spotify") echo "" ;;
        "Music"|"Apple Music") echo "󰎆" ;;
        "VLC") echo "󰕼" ;;
        "IINA") echo "󰕧" ;;

        # Design
        "Figma") echo "" ;;
        "Adobe Photoshop"|"Photoshop") echo "" ;;
        "Sketch") echo "" ;;

        # Utilities
        "Finder") echo "󰀶" ;;
        "System Settings"|"System Preferences") echo "" ;;
        "Activity Monitor") echo "󰄮" ;;
        "Docker"|"Docker Desktop") echo "" ;;
        "Postman") echo "󰛮" ;;

        # Default fallback
        *) echo "󰣆" ;;
    esac
}

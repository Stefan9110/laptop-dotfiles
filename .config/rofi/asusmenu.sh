#!/bin/sh

## Author	Stefan911
## Github	@Stefan9110

# Options
performance=" Performance"
balanced=" Balanced"
quiet=" Quiet"

options="$performance\n$balanced\n$quiet"

profile="$(echo -e "$options" | rofi -theme $HOME/.config/rofi/themes/rounded-purple-noicon.rasi -p "Fan profile" -dmenu -selected-row 0 | grep -Eo "[a-zA-Z]+")"

if [ ! -z $profile ]; then
	asusctl profile -P $profile
	notify-send "Fan profie changed" "Your fan profile was changed to $profile"
fi

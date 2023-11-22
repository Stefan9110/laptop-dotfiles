#!/bin/sh

## Author	Stefan911
## Github	@Stefan9110

# Options
dir="$HOME/.config/rofi/"
rofi_command="rofi -theme $dir/themes/fanmenu.rasi"

performance="󱑬 "
balanced="󰈐 "
quiet="󰠝 "

options="$performance\n$balanced\n$quiet"

profile="$(printf "$options" | $rofi_command -p "Fan profile" -format i -dmenu -selected-row 0 | grep -Eo "[a-zA-Z]+")"

echo $profile

case $profile in
$performance)
	assuctl profile -P performance
	notify-send "Fan profie changed" "Your fan profile was changed to $performance Performance"
	;;
$balanced)
	asusctl profile -P balanced
	notify-send "Fan profie changed" "Your fan profile was changed to $balanced Balanced"
	;;
$quiet)
	asusctl profile -P quiet
	notify-send "Fan profie changed" "Your fan profile was changed to $quiet Quiet"
	;;
esac

if [ ! -z $profile ]; then
	asusctl profile -P $profile
	notify-send "Fan profie changed" "Your fan profile was changed to $profile"
fi

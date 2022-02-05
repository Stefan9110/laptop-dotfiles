#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x
## Modified by: Stefan911

dir="$HOME/.config/rofi/"
rofi_command="rofi -theme $dir/themes/powermenu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

function lock_screen() {
	if [[ -f /usr/bin/betterlockscreen ]]; then
		betterlockscreen -l --off 3
	else
		exit 1;
	fi
}

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "$uptime" -dmenu -selected-row 0)"

case $chosen in
	$shutdown)
		systemctl poweroff
		;;
	$reboot)
		systemctl reboot
		;;
	$lock)
		lock_screen
		;;
	$suspend)
		systemctl suspend && lock_screen
		;;
	$logout)
		bspc quit
		;;
esac

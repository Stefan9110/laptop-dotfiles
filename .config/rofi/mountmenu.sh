#!/bin/sh

## Author	Stefan911
## Github	@Stefan9110

# Options
USB_DRIVES=$(lsblk -d -o name,rm | grep -E ".+1$" | cut -f1 -d" ")
OPTIONS=""
FOUND=0


for drive in $USB_DRIVES; do
	if [ -z "$(lsblk -d /dev/$drive -o mountpoints | grep -Ev "MOUNTPOINTS")" ]; then
		icon="  "
	else
		icon="  "
	fi
	
	if [ $FOUND -eq 0 ]; then
		OPTIONS="${OPTIONS}${icon}/dev/${drive}"
		FOUND=1
	else 
		OPTIONS="${OPTIONS}\n${icon}/dev/${drive}"
	fi
done

if [ -z "$OPTIONS" ]; then
	exit 1
fi

to_mount="$(echo "$OPTIONS" | rofi -theme $HOME/.config/rofi/themes/rounded-purple-noicon.rasi -p "USB Mount Menu" -dmenu -selected-row 0 | grep -Eo "/dev/.+")"

[ -z $to_mount ] && exit 2

if [ -z "$(lsblk -d $to_mount -o mountpoints | grep -Ev "MOUNTPOINTS")" ]; then
	point=$(echo $(udisksctl mount -b $to_mount) | grep -Eo "/run.+")
	[ $# -gt 0 ] && [ ! -z $1 ] && echo $1 | grep -Eoq "f" && thunar "$point" & sleep 0.45 && notify-send "USB Mount" "Mounted $to_mount to $point"
else
	udisksctl unmount -b $to_mount
	notify-send "USB Unmount" "Unmounted $to_mount"
fi

#!/bin/bash

## Author	Stefan911
## Github	@Stefan9110

# Options
USB_DRIVES="$(lsblk -A -f --pairs -o name,label)"
OPTIONS=""
FOUND=0

echo $USB_DRIVES

OLDIFS="$IFS"
IFS=$'\n'
for drive in ${USB_DRIVES//\\n/}; do
	name=$(echo $drive | grep -Eo "NAME=\"[a-zA-Z0-9]+\"" | cut -d"=" -f2 | sed "s/\"//g")
	label=$(echo $drive | grep -Eo "LABEL=\"[a-zA-Z0-9 ]+\"" | cut -d"=" -f2 | sed "s/\"//g")
	echo $drive
	echo "$name ; $label;"
	[ -z $label ] && continue
	if [ -z "$(lsblk -d /dev/$name -o mountpoints | grep -Ev "MOUNTPOINTS")" ]; then
		icon="禍  "
	else
		icon="  "
	fi
	
	if [ $FOUND -eq 0 ]; then
		OPTIONS="${OPTIONS}${icon}  /dev/${name}    $label"
		FOUND=1
	else 
		OPTIONS="${OPTIONS}\n${icon}  /dev/${name}    $label"
	fi
done
IFS="$OLDIFS"

if [ -z "$OPTIONS" ]; then
	exit 1
fi

to_mount="$(echo -e "$OPTIONS" | rofi -theme $HOME/.config/rofi/themes/rounded-purple-noicon.rasi -p "USB Mount Menu" -dmenu -selected-row 0 | grep -Eo "/dev/[a-zA-Z0-9]+")"

[ -z $to_mount ] && exit 2

if [ -z "$(lsblk -d $to_mount -o mountpoints | grep -Ev "MOUNTPOINTS")" ]; then
	point=$(echo $(udisksctl mount -b $to_mount) | grep -Eo "/run.+")
	[ $# -gt 0 ] && [ ! -z $1 ] && echo $1 | grep -Eoq "f" && thunar "$point" & sleep 0.45 && notify-send "USB Mount" "Mounted $to_mount to $point"
else
	udisksctl unmount -b $to_mount
	notify-send "USB Unmount" "Unmounted $to_mount"
fi

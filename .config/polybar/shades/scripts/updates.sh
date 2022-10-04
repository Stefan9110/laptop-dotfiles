#!/bin/sh

NOTIFY_ICON="/home/elpengu/.config/neofetch/arch.png"
CHECK_INTERNET_BIN="/home/elpengu/.local/bin/check_internet"

get_updates() {
	echo "$(checkupdates 2>/dev/null | wc -l)"
}

while true; do
	eval "$CHECK_INTERNET_BIN" || (echo " N/A"; sleep 30)

	UPDATES=$(get_updates)
	[ $UPDATES -gt 0 ] && echo " $UPDATES" || echo " None"
	[ $UPDATES -eq 0 ] && sleep 800 || sleep 15
done

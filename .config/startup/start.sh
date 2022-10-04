#!/bin/sh

notification_daemon() {
  while true; do
  	/home/elpengu/.local/bin/celite2 -n
  	sleep 1800
  done
}

# Set screen wallpaper
setwallpaper

# Start KeepassXC in systemtray
keepassxc &

# Start notification daemon
# sleep 2 && notification_daemon
~/.local/bin/notify_updates &

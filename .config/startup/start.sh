#!/bin/sh
# Set screen wallpaper
/home/stefan911/Wallpapers/./setwallpaper.sh

# Disable standby suspend off
xset dpms 0 0 0       

# Start KeepassXC in systemtray
keepassxc &

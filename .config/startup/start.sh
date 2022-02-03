#!/bin/sh
# Set screen wallpaper
$HOME/Wallpapers/./setwallpaper.sh

# Set mouse sens
xinput --set-prop 11 'libinput Accel Speed' -0.8

# Start KeepassXC in systemtray
keepassxc &

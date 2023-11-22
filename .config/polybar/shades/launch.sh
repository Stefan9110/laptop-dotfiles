#!/bin/sh

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/shades"

# Terminate already running bar instances
killall -KILL -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.05; done

# Launch the bar
for m in $(polybar -m | cut -d":" -f1 | sort -r); do
	MONITOR=$m polybar -q main -c "$DIR"/config.ini &
	sleep 0.5
done

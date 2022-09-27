#!/bin/sh

NOTIFY_ICON="$HOME/.config/neofetch/arch.png"
UPDATES=""

get_total_updates() { UPDATES=$(checkupdates 2>/dev/null | wc -l); }

while true; do
    get_total_updates

    # notify user of updates
    if hash notify-send &>/dev/null; then
        if [ $UPDATES -gt 50 ]; then
            notify-send -u critical -i $NOTIFY_ICON \
                "You really need to update!!" "$UPDATES New packages"
        elif [ $UPDATES -gt 25 ]; then
            notify-send -u normal -i $NOTIFY_ICON \
                "You should update soon" "$UPDATES New packages"
        elif [ $UPDATES -gt 2 ]; then
            notify-send -u low -i $NOTIFY_ICON \
                "$UPDATES New packages"
        fi
    fi

    # when there are updates available
    # every 10 seconds another check for updates is done
    while [ $UPDATES -gt 0 ]; do
        if [ $UPDATES -eq 1 ]; then
            echo " $UPDATES"
        elif [ $UPDATES -gt 1 ]; then
            echo " $UPDATES"
        else
            echo " None"
        fi
        sleep 10
        get_total_updates
    done

    # when no updates are available, use a longer loop, this saves on CPU
    # and network uptime, only checking once every 30 min for new updates
    while [ $UPDATES -eq 0 ]; do
        echo " None"
        sleep 1800
        get_total_updates
    done
done

#!/bin/sh
#
# Check the battery state

main() {
    while true
    do
        # Read current battery percentage and status
        read bat_perc < /sys/class/power_supply/BAT1/capacity
        read bat_status < /sys/class/power_supply/BAT1/status
        # Send warning if battery is low and no charger is plugged in
        if test $bat_perc -le 5 && test $bat_status != 'Charging'
        then
            notify-send --urgency=ciritcal \
                "Plug in a charger, battery is below 5%!"
        fi
        sleep 300
    done
}

main


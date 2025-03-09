#!/bin/sh
#
# Check the battery state

get_battery() {
    read bat_perc < /sys/class/power_supply/BAT1/capacity
    read bat_status < /sys/class/power_supply/BAT1/status
    # Send warning if battery is low and no charger is plugged in
    test $bat_perc -le 5 && test $bat_status != 'Charging' \
        && notify-send --urgency=ciritcal "Plug in a charger, low battery!"
    echo "${bat_perc}%-${bat_status} "
}

main() {
    test -d /sys/class/power_supply/BAT1 && bat=$(get_battery)
    my_date=$(date "+%a,%d.%m.%y-%H:%M")
    weather=$(<$HOME/.cache/weather/weather)
    echo "${bat} ${weather} ${my_date}"
}

main


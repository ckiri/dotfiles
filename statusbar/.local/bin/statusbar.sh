#!/bin/sh
#
# Print a status of different things to stdout 
main() {
    while true
    do
        net_status=$(nmcli --colors no networking connectivity)
        net="NET:$net_status "
        read _ _ _ ram_used _ _ _ _ <<< $(free -h -L)
        ram="RAM:${ram_used} "
        test $(ps -Ao comm | grep "weather.sh") \
                && read wttr_sym wttr_temp < $HOME/.cache/weather/weather
        wttr="${wttr_sym}${wttr_temp} "
        date=$(date +%a,%d.%m.%y,%H:%M)
        if test -d /sys/class/power_supply/BAT\*
        then
            read bat_perc < /sys/class/power_supply/BAT1/capacity
            read bat_status < /sys/class/power_supply/BAT1/status
            bat="BAT:${bat_perc}%-${bat_status} "
            statusbar="${net}${ram}${bat}${wttr}${date}"
        else
            statusbar="${net}${ram}${wttr}${date}"
        fi
        printf "${statusbar}\n"
        sleep 30
    done
}

main


#!/bin/sh
#
# Read in files and print a status of different things to stdout 

main() {
    while true
    do
        # Check network status
        net_status=$(nmcli --colors no networking connectivity)
        net="NET:$net_status "
        # Read RAM usage
        read _ _ _ _ _ ram_used _ _ <<< $(free -h -L)
        ram="RAM:${ram_used} "
        # Check if weather.sh script is running. If so, read in cached weather
        read wttr_condition wttr_temp < $HOME/.cache/weather/weather
        wttr="${wttr_condition}:${wttr_temp} "
        # Format the date
        date=$(date +%a,%d.%m.%y,%H:%M)
        # Check if device has a battery
        if test -d /sys/class/power_supply/BAT*
        then
            # Read current battery percentage and status
            read bat_perc < /sys/class/power_supply/BAT1/capacity
            read bat_status < /sys/class/power_supply/BAT1/status
            # Send warning if battery is low and no charger is plugged in
            test $bat_perc -le 5 \
                    && test $bat_status != 'Charging' \
                    && notify-send "Charge, Battery < 5%!"
            bat="BAT:${bat_perc}%%-${bat_status} "
            statusbar="${net}${ram}${bat}${wttr}${date}"
        else
            statusbar="${net}${ram}${wttr}${date}"
        fi
        printf "${statusbar}\n"
        sleep 30
    done
}

main


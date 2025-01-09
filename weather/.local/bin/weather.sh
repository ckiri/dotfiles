#!/bin/sh
#
# Fetch weather information from wttr.in

# Request wttr.in API, then sleep for 30 min
get_weather() {
    while true
    do
        wttr=$(curl "wttr.in/~?format=%C+%t") \
                && printf "$wttr\n" > $HOME/.cache/weather/weather
        sleep 1800
    done
}

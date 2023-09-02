#!/bin/bash
#
# Get weather information from wttr.in

get_weather() {
  while true; do
    local wttr
    wttr=$(curl "wttr.in/~?format=1")

    if [[ -n "$wttr" ]]; then 
      echo "$wttr" > $HOME/.local/bin/weather/weather.txt
    fi
    sleep 1800
  done
}

get_weather

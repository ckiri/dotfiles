#!/bin/bash
#
# Get weather information from wttr.in

get_weather() {
  while true; do
    local wttr
    wttr=$(curl "wttr.in/~?format=2\n")

    if [[ -n "$wttr" ]]; then 
      echo "$wttr" > $HOME/.local/bin/weather/weather
    fi
    sleep 1800
  done
}

get_weather

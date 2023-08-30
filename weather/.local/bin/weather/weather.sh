#!/bin/bash
#
# Get weather information from wttr.in

get_weather() {
  while :; do
    local wttr
    read wttr "wttr.in/Besigheim?format=1" 

    if [[ -n "$wttr" ]]; then 
      echo $wttr > $HOME/.local/bin/weather/weather.txt
    fi
    sleep 1800
  done
}

get_weather

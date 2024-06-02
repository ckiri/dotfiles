#!/bin/bash
#
# Fetch weather information from wttr.in

# Request wttr.in API, then sleep for 30 min
get_weather() {
  while true; do
    local wttr
    wttr=$(curl "wttr.in/~?format=%c+%t") && cache
    sleep 1800
  done
}

# If response was reveived, save it to a file
cache() {
  if [[ -n "$wttr" ]]; then 
      echo "$wttr" > $HOME/.cache/weather/weather
  fi
}

get_weather

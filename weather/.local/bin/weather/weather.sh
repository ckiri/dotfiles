#!/bin/bash
#
# Get weather information from wttr.in

get_weather() {
  while true; do
    local wttr
    wttr=$(curl "wttr.in/~?format=%C+%t") && store_to_file
  done
  sleep 1800
}

store_to_file() {
  if [[ -n "$wttr" ]]; then 
      echo "$wttr" > $HOME/.cache/weather/weather
  fi
}

get_weather

#!/bin/bash
#
# Get weather information from wttr.in

get_weather() {
  while :; do
    curl "wttr.in/?format=1" > weather.txt
    sleep 3600
  done
}

get_weather

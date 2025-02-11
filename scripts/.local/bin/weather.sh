#!/bin/sh
#
# Fetch weather information from wttr.in

test ! -d ~/.cache/weather && mkdir -p ~/.cache/weather

while true
do
    wttr=$(curl "wttr.in/~?format=%C+%t") \
            && printf "$wttr\n" > $HOME/.cache/weather/weather
    sleep 1800
done

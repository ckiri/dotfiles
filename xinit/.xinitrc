#!/bin/sh
xsetroot -solid '#000000' &
~/.fehbg &
#xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
redshift -l 49.0:9.2 -t 5700:3600 -b 1:0.75 -m randr -v & # Enable eyesaving mode
xset r rate 200 30 & # Set cursor speed
dunst &
unclutter &
sxhkd &
~/.local/bin/weather/weather.sh &
~/.local/bin/statusbar/statusbar.sh &
exec ~/.local/bin/dwm/startdwm.sh # Launch WM, must be last!


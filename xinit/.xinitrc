#!/bin/sh
xsetroot -solid '#000000' &
~/.fehbg &
redshift -l 49.0:9.2 -t 5700:3600 -b 1:0.75 -m randr -v & # Emable eyesaving mode
xrandr --output HDMI-2 --mode 1920x1080 --rate 119 &
xset r rate 200 30 & # Set cursor speed
dunst &
unclutter &
slstatus &
~/.config/jsettings &
exec startdwm # Launch WM, must be last!

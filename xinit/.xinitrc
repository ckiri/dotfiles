#!/bin/sh
xsetroot -solid '#000000' &
redshift -l 49.0:9.2 -t 5700:3600 -b 1:0.75 -m randr -v & # Enable eyesaving mode
xset r rate 200 30 & # Set cursor speed
dunst &
unclutter &
sxhkd &
~/.local/bin/statusbar/statusbar.sh &
~/.local/bin/dwm/wmname.sh &
exec ~/.local/bin/dwm/startdwm.sh # Launch WM, must be last!

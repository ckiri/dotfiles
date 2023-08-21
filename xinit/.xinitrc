#!/bin/sh
xsetroot -solid '#707070' &
#~/.fehbg &
redshift -l 49.0:9.2 -t 5700:3600 -b 1:0.75 -m randr -v & # Enable eyesaving mode
xset r rate 200 30 & # Set cursor speed
dunst &
unclutter &
slstatus &
sxhkd &
~/.config/jsettings.sh &
exec startdwm # Launch WM, must be last!

#!/bin/sh
#xcompmgr -c -C -t-5 -l-5 -r4.2 -o.9 &
#picom &
xsetroot -solid '#000000' &
~/.fehbg &
redshift -l 49.0:9.2 -t 5700:3600 -b 1:0.75 -m randr -v & # Emable eyesaving mode
xset r rate 200 30 & # Set cursor speed
dunst &
unclutter &
slstatus &
rndwm &
exec startdwm # Launch WM, must be last!

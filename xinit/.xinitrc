#!/bin/sh
~/.fehbg &
#xsetroot -solid '#114488' &
redshift -l 49.0:9.2 -t 5700:3600 -b 1:0.75 -m randr -v & # Emable eyesaving mode
xset r rate 200 30 & # Set cursor speed
dunst &
unclutter &
#slstatus &
#rndwm &
xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
#exec startdwm # Launch WM, must be last!
exec qtile start

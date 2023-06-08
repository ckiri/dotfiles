#!/bin/sh
~/.fehbg &
redshift -l 49.0:9.2 -t 5700:3600 -b 1:0.75 -m randr -v & # Emable eyesaving mode
xset r rate 200 30 & # Set cursor speed
<<<<<<< HEAD
dunst &
unclutter &
slstatus &
exec startdwm
#exec qtile start # Launch WM, must be last!
=======
picom &
slstatus &
nm-applet &
exec startdwm # Launch WM, must be last!
>>>>>>> origin/laptop

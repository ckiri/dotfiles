#!/bin/sh
~/.fehbg & # Set background(last set pic)
redshift -l 49.0:9.2 -t 5700:3600 -b 0.75:0.5 -m randr -v & # Emable eyesaving mode
xset r rate 200 30 & # Set cursor speed
dunst &
picom &
exec qtile start # Launch WM, must be last!

#!/bin/sh
hsetroot -solid "#000000" & # Set Background Color
~/.fehbg &
redshift -l 49.0:9.2 -t 5700:3600 -b 1:0.5 -m randr -v &
#xrandr --output eDP-1 --brightness 0.5 &
#backlight_control -20 &
xset r rate 200 30 & # Set Cursor Speed
slstatus &
exec dwm

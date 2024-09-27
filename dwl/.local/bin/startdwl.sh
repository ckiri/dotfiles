#!/bin/sh
#
# Startup script for dwl

waybar &
gammastep -l 49.0:9.2 -t 5700:3600 -b 1:0.75 &
mpd &
blueman-applet &
dunst &
hypridle

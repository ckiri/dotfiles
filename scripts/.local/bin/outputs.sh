#! /bin/sh
# 
# Set video output settings

# This is for a laptop connected to external displays via USB-C.
# Disable the internal display.
if test -d /sys/class/power_supply/BAT1
then 
    xrandr --output DP-4-5 --mode 1920x1080 --rate 180
    xrandr --output DP-4-6 --mode 1920x1080 --rate 180
    xrandr --output eDP-1 --off
else
    xrandr --output DP-3 --mode 1920x1080 --rate 180
    xrandr --output HDMI-1 --mode 1920x1080 --rate 180
fi

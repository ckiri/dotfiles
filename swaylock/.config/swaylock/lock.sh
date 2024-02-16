#!/bin/sh
#
# Simple script for screen-locking with swaylock. 

# Run swaylock with the following styling options
swaylock \
  --indicator-radius 160 \
  --indicator-thickness 20 \
  --inside-color 00000000 \
  --inside-clear-color 00000000 \
  --inside-ver-color 00000000 \
  --inside-wrong-color 00000000 \
  --key-hl-color "$color1" \
  --bs-hl-color "$color2" \
  --ring-color "$background" \
  --ring-clear-color F8E45CFF \
  --ring-wrong-color ED333BFF \
  --ring-ver-color 51A1FFFF \
  --line-uses-ring \
  --line-color 00000000 \
  --text-color ffffffff \
  --text-clear-color ffffffff \
  --text-wrong-color ffffffff \
  --text-ver-color ffffffff \
  --separator-color 00000000 \
  --color 1E1E1EFF \
  --daemonize

# Turn off display after 2 seconds
sleep 2
hyprctl dispatch dpms off

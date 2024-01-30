#!/bin/sh

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
  --ring-clear-color cdcd00FF \
  --ring-wrong-color cd0000FF \
  --ring-ver-color 005577FF \
  --line-uses-ring \
  --line-color 00000000 \
  --font 'Dejavu Sans 40' \
  --text-color EEEEEEFF \
  --text-clear-color EEEEEEFF \
  --text-wrong-color EEEEEEFF \
  --text-ver-color EEEEEEFF \
  --separator-color 00000000 \
  --color 000000FF \
  --daemonize

hyprctl dispatch dpms off

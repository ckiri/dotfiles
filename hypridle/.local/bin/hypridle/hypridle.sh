#!/bin/sh
#
# Idle script, turns off display after 10 min
# Then suspends system to save energy

hypridle \
timeout 600 'hyprctl dispatch dpms off' \
resume 'hyprctl dispatch dpms on' \
timeout 1800 'systemctl suspend'

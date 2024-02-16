#!/bin/sh
#
# Script for handling clicks on waybar powerbutton

modes=(
  "suspend"
  "poweroff"
  "reboot"
  "lock"
  "hibernate"
)

mode_choice=$(printf "%s\n" "${modes[@]}" | tofi)

case $mode_choice in
  lock)
    ~/.config/swaylock/lock.sh
    ;;
  *)
    systemctl $mode_choice
    ;;
esac

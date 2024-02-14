#!/bin/bash
#
# Shell script that wraps hyprshot
modes=(
  "output"
  "window"
  "region"
)

mode_choice=$(printf "%s\n" "${modes[@]}" | tofi)

hyprshot -m $mode_choice

#!/bin/bash
#
# A screenshot script to be used
# with Scrot & Dmenu, only works
# under X11.
#
# How it works:
# 1. Prompts user to enter filename
# 2. Starts Scrot in selection mode
# 3. Copies screenshot to clipboard
#    & saves it under standard pic-
#    tures directory

get_filename() {
  local filename=$(dmenu -f)

  if [[ -n $filename ]]; then
    echo "$filename.png"
  else
    echo "sc-%y-%m-%d-%s.png"
  fi
}

# Write path to save Screenshot
pictures_dir=$(xdg-user-dir PICTURES)
path="$pictures_dir/"

# Executed command
scrot -e 'xclip -selection clipboard -t image/png -i $f' -s $path$(get_filename)


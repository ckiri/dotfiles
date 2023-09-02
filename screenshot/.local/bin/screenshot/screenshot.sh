#!/bin/bash
#
# A screenshot script

get_filename() {
  local filename=$(dmenu -f)

  if [[ -n $filename ]]; then
    echo "$filename.png"
  else
    echo "sc-%y-%m-%d-%s.png"
  fi
}

# Write path to save Screenshot
#
pictures_dir=$(xdg-user-dir PICTURES)
path="$pictures_dir/"

# Executed command
scrot -e 'xclip -selection clipboard -t image/png -i $f' -s $path$(get_filename)


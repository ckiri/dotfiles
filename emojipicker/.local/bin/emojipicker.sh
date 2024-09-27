#!/bin/sh
#
# Pick emojis interactively.

cat $HOME/.cache/emojilist \
  | wmenu -l 20 \
  | cut -d ',' -f 2 \
  | wl-copy -n

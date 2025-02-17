#!/bin/sh
#
# Pick emojis interactively.

cat $HOME/.cache/emojilist \
  | tofi \
  | cut -d ' ' -f 2 \
  | wl-copy -n

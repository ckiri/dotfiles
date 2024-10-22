#!/bin/sh
#
# Pick emojis interactively.

cat $HOME/.cache/emojilist \
  | menu.sh \
  | cut -d ' ' -f 2 \
  | wl-copy -n

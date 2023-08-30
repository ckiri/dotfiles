#!/bin/bash
#
# A screenshot script

# Write path to save Screenshot
path=$HOME/pics/sc/scrsht-%y-%m-%d-%s.png

# Executed command
scrot -e 'xclip -selection clipboard -t image/png -i $f' -s $path

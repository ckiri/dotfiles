#!/bin/sh
#
# Take screenshots on wayland 

grim -g "$(slurp)" - | wl-copy --type image/png

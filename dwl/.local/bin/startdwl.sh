#!/bin/sh
#
# Startup script for dwl

autostart.sh &
while true; do
	#dwm 2> ~/.dwm.log # error logging
    dwl -s autostart.sh >/dev/null 2>&1
done

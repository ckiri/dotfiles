#!/bin/sh
#
# Startup script for dwl
while true; do
	#dwm 2> ~/.dwm.log # error logging
    statusbar.sh | dwl -s autostart.sh >/dev/null 2>&1
done

#!/bin/sh
# 
# Start all necessary applications

xsetroot -solid '#000000' & # Set a solid black background
~/.fehbg & # Set the last selected background image
redshift -l 49.0:9.2 -t 5700:3600 -b 1:0.75 -m randr -v & # Enable eyesaving mode
xset r rate 200 30 & # Set cursor speed
dunst & # Activate notification service
unclutter & # Hides mounse cursor if not used
sxhkd & # Starts hotkey deamon
slstatus & # Start statusbar
dbus-update-activation-environment --all & # Start dbus activation (needed for keyring callbacks)
gnome-keyring-daemon --start --components=secrets & # Authentification deamon, necessary for eduvpn
exec ~/.local/bin/dwm/startdwm.sh # Launch WM, must be last!

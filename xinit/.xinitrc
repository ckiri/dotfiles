#! /bin/sh
#
# Start applications

# Start the notification demon
dunst 2>&1 &

# Check if a battery is avaliable, if true: start battery information demon
if test -d /sys/class/power_supply/BAT1
then
    $HOME/.local/bin/batterystate.sh 2>&1 &
fi

xsetroot -solid "#777777" >/dev/null 2>&1 & # Set a background color
xset r rate 200 30 >/dev/null 2>&1 & # Set the repeat rate (cursor moves faster in cli programms)
$HOME/.local/bin/outputs.sh 2>&1 & # Configure video outputs
redshift -l 49.0:9.2 -t 5700:3600 -m randr -v >/dev/null 2>&1 & # Start eyesaving mode
dbus-update-activation-environment --all 2>&1 & # DBus activation (Needed for keyring callbacks)
unclutter 2>&1 & # Hide cursor if not in use
exec cwm

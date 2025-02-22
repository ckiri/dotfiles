#! /bin/sh
#
# Start applications for use with a wayland compositor

kanshi >/dev/null 2>&1 & # The video output configuration daemon

# Check if device has a battery, if true, start a battery daemon
if test -d /sys/class/power_supply/BAT1
then
    $HOME/.local/bin/batterystate.sh 2>&1 &
fi

gammastep -l 49.0:9.2 -t 5700:3600 >/dev/null 2>&1 & # Enable eyesaving mode

# Set dark theme for applications
dconf write /org/gnome/desktop/interface/color-scheme '"prefer-dark"' 2>&1 & 
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark' 2>&1 & 
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark' 2>&1 &

# Start the idle daemon
swayidle -w \
    timeout 300 'brightnessctl --save && brightnessctl set 1%' resume 'brightnessctl --restore' \
    timeout 600 'niri msg output off \*' resume 'niri msg output on \*' \
    timeout 900 'gtklock -d' \
    timeout 1800 'systemctl suspend-then-hibernate' \
    before-sleep 'gtklock -d' >/dev/null 2>&1 &

swaync 2>&1 & # Notification daemon
dbus-update-activation-environment \
    --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP >/dev/null 2>&1 & # DBus activation (Needed for keyring callbacks)

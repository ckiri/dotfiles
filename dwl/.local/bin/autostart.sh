#!/bin/sh
#
# Autostart apps for use in dwl

kanshi 2>&1 &
gammastep -l 49.0:9.2 -t 5700:3600 -b 1:0.75 >/dev/null 2>&1 &
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark' 2>&1 &
gsettings set org.gnome.desktop.interface icon-theme 'Pairus-Dark' 2>&1 &
dunst 2>&1 &
swayidle -w \
    timeout 300 'brightnessctl set 1%' resume 'brightnessctl --restore' \
    timeout 600 'wlopm --off \*' resume 'wlopm --on \*' \
    timeout 900 'swaylock -f' \
    timeout 1800 'systemctl suspend-then-hibernate' >/dev/null 2>&1 &
dbus-update-activation-environment \
    --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP >/dev/null 2>&1 &

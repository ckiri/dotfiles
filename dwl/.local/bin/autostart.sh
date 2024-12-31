#!/bin/sh
#
# Autostart apps for use in dwl

kanshi 2>&1 &
gammastep -l 49.0:9.2 -t 5700:3600 -b 1:0.75 >/dev/null 2>&1 &
foot --server 2>&1 &
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark' 2>&1 &
dunst >/dev/null 2>&1 &
waybar >/dev/null 2>&1 &
blueman-applet >/dev/null 2>&1 &
nm-applet >/dev/null 2>&1 &
swayidle >/dev/null 2>&1 &
swaybg --color "#000000" --output \* 2>&1 &
dbus-update-activation-environment \
  --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP >/dev/null 2>&1 &

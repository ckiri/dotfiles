#! /bin/sh
#
# Start processes when starting a compositor/window manager
dunst 2>&1 &
if test -d /sys/class/power_supply/BAT1
then
    batterystate.sh >/dev/null 2>&1 &
fi
kanshi >/dev/null 2>&1 &
gammastep -l 49.0:9.2 -t 5700:3600 >/dev/null 2>&1 &
gsettings set org.gnome.desktop.interface gtk-theme '' 2>&1 &
gsettings set org.gnome.desktop.interface icon-theme '' 2>&1 &
//swayidle -w \
//    timeout 300 'brightnessctl --save && brightnessctl set 1%' resume 'brightnessctl --restore' \
//    timeout 600 'wlopm --off \*' resume 'wlopm --on \*' \
//    timeout 1800 'systemctl suspend-then-hibernate' >/dev/null 2>&1 &
mpd >/dev/null 2>&1 &
dbus-update-activation-environment \
    --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP >/dev/null 2>&1 &

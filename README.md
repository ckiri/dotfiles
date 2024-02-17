# .dotfiles

This repository contains all my dotfiles and scripts that I use on a daily
basis. They are far from perfect! My setup aims to be as minimalist as
possible.

This dotfiles repository contains:
* Config files:
  * alacritty - terminal emulator
  * dirs - sets variables for system paths
  * dunst - a notification client
  * electron - variables for electron applications to prevent display artifacts
    when scaling on wayland. Not needed for X11.
  * foot - terminal emulator with client-server protocoll (designed for
    wayland)
  * gtk - application settings, themeing, font etc.
  * hypr - contains hyprpaper and hyprland config, windowmanger for Wayland
  * mpd - music player deamon for playing music and stream radio
  * ncmpcpp - terminal user interface for mpd
  * nvim - neovim, texteditor config
  * qtile - window manager for X11 and Wayland, written in python
  * starship - interactive prompt
  * sxhkd - keybindings for X11 window manager
  * tmux - terminal multiplexer
  * tofi - dmenu clone for wayland, lets you run applications
  * vim - text editor config, held minimalist
  * vis - another improved vi clone, more minimalist than vim
  * waybar - statusbar for wayland
  * wofi - rofi clone for wayland, gtk based run menu similar to dmenu and tofi
  * zathura - minimalist pdf viewer
  * zsh - the best shell ever, contains scripts for ease of use

* Shell scripts:
  * aw - wrapper for starting activity-watch automatically after a x11 is
    started
  * hyprshot - wrapper for prompting user when doing a screenshot. Only works
    on wayland
  * passmenu - a clone of passmenu for x11, but used with wofi
  * powerbutton - a propts user for choosing between poweroff, suspend and so
    on
  * screenshot - a wrapper for scrot (screenshot on X11)
  * statusbar - fetches system information to display them in a status bar.
  * swaylock - locks the screen and turns off display
  * weather - fetches weather data from weather.in and caches it in a file
  * xinit - startup needed applications on X11



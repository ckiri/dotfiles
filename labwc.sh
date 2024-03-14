#!/bin/sh
#
# Setup config files of software used within the labwc window manager

stow \
  sfwbar \      # Statusbar
  labwc \       # Openbox style window manager for wayland
  wofi \        # Dmenu clone for wayland
  alacritty \   # Terminal emulator
  zsh \         # ZShell configuartion (zprofile, zshrc, zshenv)
  zathura \     # PDF viewer
  nvim \        # Text editor
  mpd \         # Music player deamon
  ncmcpp \      # Frontend for mpd
  tmux \        # Terminal multiplexer
  dirs \        # XDG directory settings
  kanshi \      # Settings and profile management
  hypridle \    # Idle deamon
  hyprlock \    # Session locking
  fontconfig \  # Force applications to use the specified font

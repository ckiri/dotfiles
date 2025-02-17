#!/bin/sh

choose_env() {
    printf "Choose a graphical env:\n1) niri (wayland)\n2) cwm (x11)\n"
    read -p "> " choice
    test $choice -eq 1 && printf "Starting niri\n" && niri --session
    test $choice -eq 2 && printf "Starting cwm\n" && startx
}

[[ -z "$SSH_CLIENT" ]] && [[ -z "$TMUX" ]] && [[ -z "$DISPLAY" ]] && choose_env

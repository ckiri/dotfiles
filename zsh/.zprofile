#!/bin/sh

select_env() {
  printf "Select a startup option:\n Labwc(1) or TTY(*)?\n"
  printf "(Default is TTY.)\n"
  printf "> "
  read choice
  printf "\n"

  if [ "$choice" = "1" ]; then
    printf "Starting Labwc\n"
    labwc
  else
    printf "Stay in TTY\n"
  fi
}

[ -z "$SSH_CLIENT" ] && [ -z "$TMUX" ] && [ -z "$DISPLAY" ] && select_env

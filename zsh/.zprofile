#!/bin/sh

select_env() {
  printf "Select a startup option:\n Labwc(1), DWL(2) or TTY(*)?\n"
  printf "(Default is TTY.)\n"
  printf "> "
  read choice
  printf "\n"

  [[ "$choice" = "1" ]] && printf "Starting Labwc\n" && labwc
  [[ "$choice" = "2" ]] && printf "Starting DWL\n" && startdwl.sh
}

[[ -z "$SSH_CLIENT" ]] && [[ -z "$TMUX" ]] && [[ -z "$DISPLAY" ]] && select_env

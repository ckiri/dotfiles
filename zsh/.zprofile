#!/bin/sh

select_env() {
  printf "Select a startup option:\nSway(1), CWM(2) or TTY(*)?\n"
  printf "(Default is TTY.)\n"
  printf "> "
  read choice
  printf "\n"
  test "$choice" = "1" && printf "Starting Sway\n" && sway
  test "$choice" = "2" && printf "Starting CWM\n" && startx 
}

test -z "$SSH_CLIENT" && test -z "$TMUX" && test -z "$DISPLAY" && select_env

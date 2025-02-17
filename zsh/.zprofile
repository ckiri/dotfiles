#!/bin/sh

select_env() {
  printf "Select a startup option:\nNiri(1), CWM(2) or TTY(*)?\n"
  printf "(Default is TTY.)\n"
  printf "> "
  read choice
  printf "\n"
  test "$choice" = "1" && printf "Starting Niri\n" && niri --session
  test "$choice" = "2" && printf "Starting CWM\n" && startx 
}

test -z "$SSH_CLIENT" && test -z "$TMUX" && test -z "$DISPLAY" && select_env

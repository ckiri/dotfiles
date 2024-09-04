if [[ -z "$SSH_CLIENT" && -z "$TMUX" && -z "$DISPLAY" ]]; then
  sep="=============================="
  echo "\n$sep\nSelect a startup option:\nLabwc(1) or TTY(*)?\n(Default is TTY.)\n$sep"
  echo -n "> "
  read choice

  case $choice in
    1)
        echo "\n$sep\nStarting Labwc.\n$sep\n"
        labwc
        ;;
    *)
        echo "\n$sep\nStay in the TTY.\n$sep\n"
        ;;
  esac
fi

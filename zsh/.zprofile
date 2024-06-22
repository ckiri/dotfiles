if [[ -z "$SSH_CLIENT" && -z "$TMUX" && -z "$DISPLAY" ]]; then
  sep="=============================="
  echo "\n$sep\nSelect a startup option:\nDWM(1), Labwc(2), Hyprland(3) or TTY(*)?\n(Default is TTY.)\n$sep"
  echo -n "> "
  read choice

  case $choice in
    1)
        echo "\n$sep\nStarting DWM.\n$sep\n"
        startx
        ;;
    2)
        echo "\n$sep\nStarting Labwc.\n$sep\n"
        labwc
        ;;
    3)
        echo "\n$sep\nStarting Hyprland.\n$sep\n"
        Hyprland
        ;;
    *)
        echo "\n$sep\nStay in the TTY.\n$sep\n"
        ;;
  esac
fi

if [[ -z "$SSH_CLIENT" && -z "$TMUX" && -z "$DISPLAY" ]]; then
  sep="=============================="
  echo "\n$sep\nSelect a startup option:\nHyprland(1), SWAY(2) or TTY(*)?\n(Default is TTY.)\n$sep"
  echo -n "> "
  read choice

  case $choice in
    1)
        echo "\n$sep\nStarting Hyprland.\n$sep\n"
        Hyprland
        ;;
    2)
        echo "\n$sep\nStarting SWAY.\n$sep\n"
        sway
        ;;
    *)
        echo "\n$sep\nStay in the TTY.\n$sep\n"
        ;;
  esac
fi

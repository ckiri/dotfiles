if [[ -z "$SSH_CLIENT" && -z "$TMUX" && -z "$DISPLAY" ]]; then
  sep="=============================="
  echo "\n$sep\nSelect an Environment:\nHyprland(1), DWM(2), DWL(3) or TTY(*)?\n(Default is TTY.)\n$sep"
  echo -n "> "
  read choice

  case $choice in
    1)
        echo "\n$sep\nStarting Hyprland.\n$sep\n"
        Hyprland
        ;;
    2)
        echo "\n$sep\nStarting DWM.\n$sep\n"
        startx
        ;;
    3)
        echo "\n$sep\nStarting DWL.\n$sep\n"
        dwl -s ~/.local/bin/dwl/startdwl.sh
        ;;
    *)
        echo "\n$sep\nStay in the TTY.\n$sep\n"
        ;;
  esac
fi

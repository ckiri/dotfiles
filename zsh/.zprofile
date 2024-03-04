if [[ -z "$SSH_CLIENT" && -z "$TMUX" && -z "$DISPLAY" ]]; then
  sep="=============================="
  echo "\n$sep\nSelect an Environment:\nHyprland(1), Qtile(2) or TTY(*)?\n(Default is TTY.)\n$sep"
  echo -n "> "
  read choice

  case $choice in
    1)
        echo "\n$sep\nStarting Hyprland WM.\n$sep\n"
        Hyprland
        ;;
    2)
        echo "\n$sep\nStarting Qtile.\n$sep\n"
        startx
        ;;
    *)
        echo "\n$sep\nStay in the TTY.\n$sep\n"
        ;;
  esac
fi

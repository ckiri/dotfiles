if [[ -z "$SSH_CLIENT" && -z "$TMUX" && -z "$DISPLAY" ]]; then
  startx
fi

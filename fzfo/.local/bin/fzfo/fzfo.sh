#!/bin/bash
#
# Fuzzy open files inside the terminal

fuzzy_opener() {
  
  local file=$(find . | fzf --reverse --border=none --no-unicode --height=~20 --algo=v1 --no-color --prompt=': ' --no-scrollbar --no-separator)
  local extension="${file##*.}"
  
  case "$extension" in
    sh|txt|md|c|cpp|html|css|ts|js|lua|py|tex|ini|toml|yaml|yml|h)
      $EDITOR $file
      ;;
    pdf|epub)
      setsid -f zathura $file >/dev/null 2>&1
      ;;
    mp4|mp3|wav)
      setsid -f mpv $file >/dev/null 2>&1
      ;;
    jpg|jpeg|JPG|JPEG|gif|png|PNG)
      setsid -f feh -F $file >/dev/null 2>&1
      ;;
    "")
      #notify-send "Oops, no file selected!"
      exit 1
      ;;
    *)
      #notify-send "No matching program found for file extension: \"$extension\". Opening with $EDITOR"
      $EDITOR $file
      ;;
  esac
}

fuzzy_opener

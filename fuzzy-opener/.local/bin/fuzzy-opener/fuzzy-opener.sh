#!/bin/bash
#
# Fuzzy open files inside the terminal

fuzzy_opener() {
  
  local file=$(find . | fzf --reverse --border=none --no-unicode --height=~20 --algo=v1)
  local extension="${file##*.}"
  
  case "$extension" in
    sh|txt|md|c|cpp|html|css|ts|js|lua|py|tex|ini|toml|yaml|yml|h)
      nvim $file
      ;;
    pdf|epub)
      setsid -f zathura $file >/dev/null 2>&1
      ;;
    mp4|mp3|wav)
      setsid -f mpv $file >/dev/null 2>&1
      ;;
    jpg|jpeg|JPG|JPEG|gif|png|PNG)
      devour feh -F $file
      ;;
    *)
      notify-send "No matching program found for file extension: \"$extension\""
      nvim $file
      ;;
  esac
}

fuzzy_opener

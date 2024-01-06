#!/bin/bash
#
# Script to start activitywatch screen time recording only if Xorg is running

start() {
  
  local xorg_pid=""

  while [[ ! "$xorg_pid" ]]; do
    sleep 2
    xorg_pid=$(pgrep Xorg)
  done

  cd /opt/activitywatch

  ./aw-watcher-afk/aw-watcher-afk &
  ./aw-watcher-window/aw-watcher-window &
  notify-send "ActivityWatch started"
  ./aw-server/aw-server;
}

start

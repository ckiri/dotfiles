#!/bin/bash
#
# Refreshes the statusbar

#######################################
# Refresh the statusbar by finding the
# process id of the sleep process which
# is a child of statusbar
#######################################
refresh () {
  local statusbar_pid=$(pgrep statusbar.sh -n)
  local sleep_pid=$(pgrep -P "$statusbar_pid" sleep)

  if [[ -n "$sleep_pid" ]]; then
    kill "$sleep_pid"
  fi
}

refresh


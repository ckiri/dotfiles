#!/bin/bash
#
# Refreshes the statusbar

# Get the PID of the statusbar shell script
statusbar_pid=$(pgrep statusbar.sh | awk 'NR == 1 {print $1}')

# Find and kill the sleep child-process spawned by the statusbar
sleep_pid=$(pgrep -P "$statusbar_pid" sleep | awk 'NR == 1 {print $1}')

# Check if a pid is found
if [ -n "$sleep_pid" ]; then
  kill "$sleep_pid"
else
  notify-send "Sleep process of statusbar ($status_bar) not found or already terminated."
fi

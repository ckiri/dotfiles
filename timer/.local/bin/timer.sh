#!/bin/sh
#
# Shell script that acts like a timer and uses notify-send to display the time.

appname="Timer"
time=$1
timer=$1
notification_id=""
while [ $timer -gt 0 ]; do
  sleep 1
  timer=$(expr $timer - 1)
  time_perc=$(expr $timer \* 100 / $time)
  if [ -z $notification_id ]; then
    # printf "No ID avaliable.\n"
    notification_id=$(notify-send \
      -h int:value:$time_perc "Time left: ${timer}s" \
      -a "$appname" \
      -i "timer-symbolic.svg" \
      -p)
    # printf "ID is: $notification_id\n"
  else
    # printf "Update notification...\n"
    notify-send \
      -h int:value:$time_perc "Time left: ${timer}s" \
      -a "$appname" \
      -i "/usr/share/icons/Papirus-Dark/symbolic/status/timer-symbolic.svg" \
      -r $notification_id
  fi
done
notify-send \
  "Time is UP!" \
  -a "$appname" \
  -i "/usr/share/icons/Papirus-Dark/symbolic/status/timer-symbolic.svg" \
  -r $notification_id \
  -u critical

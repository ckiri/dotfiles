#!/bin/sh
#
# Simple timer script that uses notify-send to display time.

appname="Timer"

# Print description, examples & options of script 
print_help() {
  printf "\n"
  printf "$appname is a script that uses notfiy-send and a deamon like dunst\n"
  printf "to display leftover time in seconds ⏳\n"
  printf "\n"
  printf "Examples:\n"
  printf "\ttimer.sh 10\tSets timer to 10 seconds\n"
  printf "\ttimer.sh 5 m\tSets timer to 5 minutes\n"
  printf "\ttimer.sh 1 h\tSets timer to 1 hour\n"
  printf "\n"
  printf "Options:\n"
  printf "\t-h, --help\tDisplay this help message\n"
  printf "\n"
  exit 0
}

# Use wmenu for interactive user input
wmenu_prompt() {
  input=$(printf "\n" | wmenu -S "#222222" -p "Specify the time ⏰:")
  read time time_unit <<< $input
}

# Timer logic
main() {
  if [ "$time_unit" = "h" ]; then
    time=$(expr $time \* 3600)
  elif [ "$time_unit" = "m" ]; then
    time=$(expr $time \* 60)
  fi
  timer=$time
  notification_id=""
  while [ "$timer" -gt 0 ]; do
    sleep 1
    timer=$(expr $timer - 1)
    time_perc=$(expr $timer \* 100 / $time)
    if [ -z $notification_id ]; then
      notification_id=$(notify-send \
        -h int:value:$time_perc "Time left: ${timer}s" -a "$appname" -p)
    else
      notify-send \
        -h int:value:$time_perc "Time left: ${timer}s" \
        -a "$appname" \
        -r $notification_id
    fi
  done
  notify-send \
    "Time is UP!" \
    -a "$appname" \
    -r $notification_id \
    -u critical
}

# Check input
if [ -z $1 ]; then                                  # No arguments were given
  wmenu_prompt
elif [ "$1" = "-h" ] || [ "$1" = "--help" ]; then   # -h/--help option used
  print_help
else                                                # Timer started with args
  time=$1
  time_unit=$2
fi

# Run the timer
main 

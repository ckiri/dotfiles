#!/bin/bash
#
# Statusline for tiling window managers that use xsetroot as status display.

#######################################
# Get volume level from pulse.
# Outputs:
#   Writes volume level to stdout.
#######################################
get_vol() {
  local vol="$(pulsemixer --get-volume \
    | awk '{print ($1 + $2) / 2}')"
  local mute="$(pulsemixer --get-mute)"

  if [[ "$mute" -eq 1 ]]; then
    echo "🔇 $vol%"
  elif [[ "$vol" -ge 50 ]]; then
    echo "🔊 $vol%"
  else
    echo "🔉 $vol%"
  fi
}

#######################################
# Get little endian formated date.
# Outputs:
#   Writes formated date to stdout.
#######################################
get_date() {
  local date=$(date +%a,' '%d.%m.%y' '%H:%M)

  echo "$date"
}

# TODO(ckiri): bugfix fetching in wired mode
#######################################
# Get network statistics like type,
# signal quality, ip address
# & network name
# Outputs:
#   Writes formated stats to stdout.
#######################################
get_net_stats() {
  local connection=$(nmcli connection show --active \
    | awk 'NR == 2')
  local device=$(awk '{print $4}' <<< "$connection")
  local type=$(awk '{print $3}' <<< "$connection")
  local name=$(awk '{print $1}' <<< "$connection")
  local ip=$(ifconfig $device \
    | awk 'NR == 2 {print $2}')

  case "$name" in
    "lo")
      echo "🔴 no connection"
      ;;
    *)
      if [[ $type == 'wifi' ]]; then
        local quality=$(iwconfig $device \
          | grep "Link Quality" \
          | awk -F= '{print $2}' \
          | awk '{print $1}')
        echo "📡 $ip $name 📶 $quality"
      else
        echo "🌐 $ip $name"
      fi
      ;;
  esac
}

#######################################
# Get RAM usage.
# Outputs:
#   Writes avaliable RAM and usage to
#   stdout.
#######################################
get_ram_usage() {
  local ram_usage=$(free -h \
    | awk 'NR == 2 {print $3 "/" $2}')

  echo "🧠 $ram_usage"
}

#######################################
# Get disk usage.
# Outputs:
#   Writes used disk and usage to
#   stdout.
#######################################
get_disk_stats() {
  local df=$(df -h)
  local sys_space=$(echo "$df" \
    | awk '/\/$/ {print $3}')
  local sys_perc=$(echo "$df" \
    | awk '/\/$/ {print $5}')

  echo "💾 $sys_space, $sys_perc"
}

#######################################
# Get batterie capacity percentage.
# Outputs:
#   Writes avaliable batterie 
#   percentage to stdout.
#######################################
get_bat_perc() {
  local bat_perc=$(cat /sys/class/power_supply/BAT1/capacity)

  if [[ $bat_perc -ge 20 ]]; then
    echo "🔋 $bat_perc%"
  else
    echo "🪫 $bat_perc%"
  fi
}

#######################################
# Get charging state.
# Outputs:
#   Writes charging emoji to stdout.
#######################################
get_charge_state() {
  local charge_state=$(cat /sys/class/power_supply/BAT1/status)

  if [[ $charge_state == "Charging" ]]; then
    echo "🔌"
  fi
}

# TODO(ckiri): Create a get_weather function

#######################################
# The main function runs a while loop.
# Outputs:
#   Constructs the statusbar string
#   & executes xsetroot with statusbar
#   as string with the name flag.
#######################################
main() {
  while :
  do
    local vol=$(get_vol)
    local net=$(get_net_stats)
    local ram=$(get_ram_usage)
    local disk=$(get_disk_stats)
    local bat=$(get_bat_perc)
    local charge=$(get_charge_state)
    local date=$(get_date)
    local statusbar="$net | $vol | $charge$bat | $ram | $disk | $date"
		
    xsetroot -name "$statusbar"  # Set $statusbar as parameter for root window
    sleep 60 
  done
}

main


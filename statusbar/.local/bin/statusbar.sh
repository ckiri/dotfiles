#!/bin/bash
#
# Statusbar for tiling window managers that use xsetroot to display status information.

#######################################
# Get volume level from pulse.
# Outputs:
#   Writes volume level to stdout.
#######################################
get_vol() {
  local vol_l
  local vol_r
  read vol_l vol_r <<< $(pulsemixer --get-volume)
  local vol=$(( ("$vol_l" + "$vol_r") / 2 ))
  local mute="$(pulsemixer --get-mute)"

  if [[ "$mute" -eq 1 ]]; then
    echo "vol: mute($vol%)"
  elif [[ "$vol" -ge 50 ]]; then
    echo "vol: $vol%"
  else
    echo "vol: $vol%"
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

#######################################
# Get the ip address from ip addr show
# Arguments:
#   Name of the interface as an
#   argument for ip.
# Outputs:
#   Writes ip address to stdout.
#######################################
# TODO: Find a better solution then piping grep into grep
get_ip() {
  local ip=$(ip addr show $1 \
    | grep -oE 'inet [0-9.]+' \
    | grep -v '^inet 127\.' \
    | cut -d ' ' -f 2 \
    | cut -d '/' -f 1)

  echo "$ip"
}

#######################################
# Get network statistics like type,
# signal quality, ip address
# & network name
# Outputs:
#   Writes formated stats to stdout.
#######################################
# TODO: If a second NC exists, adjust formating
get_net_stats() {
  local connection=$(nmcli connection show --active \
    | grep -v NAME -m 1)
  local name=$(grep -o '^[^[:space:]]*' <<< "$connection")

  case "$name" in
    "lo")
      echo "No Connection"
      ;;
    *)
      local type
      read _ _ temp_type _ <<< "$connection"
      type=$temp_type

      if [[ "$type" == 'wifi' ]]; then
        local device=$(read _ _ _ device <<< "$connection")
        echo "WIFI:$name"
      else
        local device=$(read _ _ _ _ _ device <<< "$connection")
        echo "ETH:$device"
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
  local used 
  local total
  read _ total used _ _ _ _ <<< $(free -h | grep -E 'Mem:' -m 2)

  echo "RAM: $used/$total"
}

#######################################
# Get disk usage.
# Outputs:
#   Writes used disk and usage to
#   stdout.
#######################################
get_disk_stats() {
  local sys_space
  local sys_perc
  read _ _ sys_space _ sys_perc _ <<< $(df -h | grep -E '/$')

  echo "disk: $sys_space, $sys_perc"
}

#######################################
# Get batterie capacity percentage.
# Outputs:
#   Writes avaliable batterie 
#   percentage to stdout.
#######################################
get_bat_perc() {
  local bat_perc=$(</sys/class/power_supply/BAT1/capacity)

  if [[ $bat_perc -ge 20 ]]; then
    echo "BAT:${bat_perc}%"
  else
    echo "BAT:${bat_perc}%"
  fi
}

#######################################
# Get charging state.
# Outputs:
#   Writes charging emoji to stdout.
#######################################
get_charge_state() {
  local charge_state
  
  charge_state=$(</sys/class/power_supply/BAT1/status) \
    && if [[ $charge_state == 'Charging' ]]; then
      echo "+"
    else 
      echo "-"
    fi
}

#######################################
# Get weather information from a weather
# script using wttr.in.
#   Outputs
#   Writes weather emoji and temperature
#   to stdout.
########################################
get_weather() {
  local sym 
  local temp
  read sym temp <<< $(<$HOME/.cache/weather/weather)

  echo "$sym $temp"
}

#######################################
# The main function runs a while loop.
# Outputs:
#   Constructs the statusbar string
#   & executes xsetroot with statusbar
#   as string with the name flag.
#######################################
main() {
  local statusbar
  # local vol=$(get_vol)
  local net=$(get_net_stats)
  local ram=$(get_ram_usage)
  local disk=$(get_disk_stats)
  local charge=$(get_charge_state)
  local wttr=$(get_weather)
  local date=$(get_date)

  if [[ -n "$charge" ]]; then
    local bat=$(get_bat_perc)
    statusbar="$net $bat$charge $wttr $date"
  else
    statusbar="$net $wttr $date"
  fi

  echo $statusbar # Set $statusbar as parameter for root window
}

main


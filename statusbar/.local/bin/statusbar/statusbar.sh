#!/bin/bash
#
# Statusline for tiling window managers that use xsetroot as status display.

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

#######################################
# Get the ip address from ip addr show
# Arguments:
#   Name of the interface as an
#   argument for ip.
# Outputs:
#   Writes ip address to stdout.
#######################################
# TODO(ckiri): find a better solution then piping grep into grep
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
get_net_stats() {
  local connection=$(nmcli connection show --active | grep -v NAME -m 1)
  local name=$(grep -o '^[^[:space:]]*' <<< "$connection")

  case "$name" in
    "lo")
      echo "🔴 no connection"
      ;;
    *)
      local type
      read _ _ temp_type _ <<< "$connection"
      type=$temp_type

      if [[ "$type" == 'wifi' ]]; then
        local device=$(read _ _ _ device <<< "$connection")
        
        echo "📡 $(get_ip $device) $name"
      else
        local device=$(read _ _ _ _ _ device <<< "$connection")

        echo "🌐 $(get_ip $device) $name"
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

  echo "🧠 $used/$total"
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

  echo "💾 $sys_space, $sys_perc"
}

#######################################
# Get batterie capacity percentage.
# Outputs:
#   Writes avaliable batterie 
#   percentage to stdout.
#######################################
get_bat_perc() {
  local low_bat_notify
  local bat_perc=$(</sys/class/power_supply/BAT1/capacity)

  if [[ $bat_perc -ge 20 ]]; then
    low_bat_notify=0;

    echo "🔋 $bat_perc%"
  else
    echo "🪫 $bat_perc%"

    if [[ $low_bat_notify -e 0 ]]; then
      notify-send -u critical "Battery low @ 🪫 $bat_perc%, plug in charger! 🔌"
      low_bat_notify=1
    fi
  fi

  }

#######################################
# Get charging state.
# Outputs:
#   Writes charging emoji to stdout.
#######################################
get_charge_state() {
  local charge_state=$(</sys/class/power_supply/BAT1/status)

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


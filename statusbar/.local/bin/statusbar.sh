#!/bin/bash
#
# Statusbar for tiling window managers that use xsetroot to display status information.

#######################################
# Get volume level from pulse.
# Outputs:
#   Writes volume level to stdout.
#######################################
fvol() {
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
fdate() {
  local date=$(date +%a,%d.%m.%y,%H:%M)

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
# NOTE: This function is pretty unreliable if more then 2 interfaces are used
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
fnet() {
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
fram() {
  local used 
  local total
  read _ total used _ _ _ _ <<< $(free -h | grep -E 'Mem:' -m 2)

  echo "RAM:$used/$total"
}

#######################################
# Get disk usage.
# Outputs:
#   Writes used disk and usage to
#   stdout.
#######################################
fdisk() {
  local sys_space
  local sys_perc
  read _ _ sys_space _ sys_perc _ <<< $(df -h | grep -E '/$')

  echo "disk: $sys_space, $sys_perc"
}

#######################################
# Get the charging status.
# Outputs:
#   Writes charging status to stdout.
#######################################
fbat_status() {
    read status < /sys/class/power_supply/BAT1/status
    if [ $status == 'Charging' ]
    then
        printf "+"
    else 
        printf "-"
    fi
}

#######################################
# Get batterie capacity percentage.
# Outputs:
#   Writes batterie percentage and
#   charging state to stdout.
#######################################
fbat() {
    read bat_perc < /sys/class/power_supply/BAT1/capacity
    if [ $bat_perc -ge 20 ]
    then
        printf "BAT:${bat_perc}%"
        fbat_status
        printf "\n"
    else
        printf "BAT:${bat_perc}%"
        fbat_status
        printf "\n"
    fi
}

#######################################
# Get a recent weather condition
# Returns:
#   Weather condition containing a
#   symbol and temperature if weather
#   script is running.
#   Otherwiese return not avaliable
########################################
fweather() {
    if ps -Ao comm | grep "weather.sh"
    then
        read sym temp < $HOME/.cache/weather/weather
        printf "$sym $temp\n"
    else
        printf "n/a\n"
    fi
}

#######################################
# The main function runs a while loop.
# Outputs:
#   Constructs the statusbar string
#######################################
main() {
    #while true
    #do
        vol=$(fvol)
        net=$(fnet)
        ram=$(fram)
        disk=$(fdisk)
        wttr=$(fweather)
        date=$(fdate)
        if [ -d /sys/class/power_supply/BAT\* ]
        then
            bat=fbat
            statusbar="${net} ${ram} ${bat} ${wttr} ${date}"
        else
            statusbar="${net} ${ram} ${wttr} ${date}"
        fi
        printf "${statusbar}\n"
    #    sleep 30
    #done
}

main


#!/bin/sh
# This file echos a string that will be processed and displayed on the spectrwm bar.
# Any spectrwm bar_format character sequences will be expanded.

# Echo the name(s) of connected bluetooth 
# device(s) via BlueZ (bluetoothctl).
bluetooth () {
  con=$(
    bluetoothctl devices \
    | cut -f2 -d' ' \
    | while read uuid; do bluetoothctl info $uuid; done \
    | grep -e "Name\|Connected: yes" \
    | grep -B1 "yes" \
    | head -n 1 \
    | cut -d\  -f2-
  )
  
  if ! [ -z "$con" ]; then
    con="󰂯 ${con}"
  else
    con="󰂲"
  fi

  echo "$con"
}

# Echo an icon representing volume from amixer Master.
volume () {
  vol=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
  vol=${vol::-1}

  if [ "$vol" -eq 0 ]; then
    echo "󰖁"
   elif [ "$vol" -lt 33 ]; then
    echo "󰕿"
  elif [ "$vol" -lt 66 ]; then
    echo "󰖀"
  else
    echo "󰕾"
  fi
}

# Echo an icon representing internet connectivity.
internet () {
  if nc -zw1 google.com 443; then
    echo "󰈁"
  else
    echo "󰈂"
  fi
}

# Echo the amount of memory currently being used.
memory () {
  mem=$(free -m | awk '/^Mem:/{print $3}')
  echo "󰍛 ${mem}MiB"
}

# Update the bar utilities every five seconds.
while :; do
  # Display username and window manager workspace info on left.
  left="+|L󱄅 ${USER}   +L   +M  󰌨 +S"

  # Display date and time in the center.
  center="+|C$(date +"%a %b %d %H:%M")"

  # Display utilities from this script on the right.
  right="+|R$(memory)  $(bluetooth)  $(volume)  $(internet)"

  echo "${left}${center}${right}"
  sleep 5
done

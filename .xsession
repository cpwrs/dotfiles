#!/bin/ksh
# xenodm configuration


# Run login shell config (xenodm doesn't start a login shell).
. /home/carson/.profile

# Set the background color.
xsetroot -solid rgb:08/08/08

# Set screen resolution
xrandr --size 1

# Remap capslock to ctrl.
setxkbmap -option 'ctrl:swapcaps'

# Start spectrwm window manager.
spectrwm -c /home/carson/.spectrwm.conf

#!/bin/ksh
# xenodm configuration


# Run login shell config (xenodm doesn't start a login shell).
. /home/carson/.profile

# Set the background color.
xsetroot -solid rgb:10/10/10
hsetroot -solid "#101010"

# Allow local users to access X11.
xhost +local

# Remap capslock to ctrl.
setxkbmap -option 'ctrl:swapcaps'

# Start spectrwm window manager.
exec spectrwm -c /home/carson/.spectrwm.conf

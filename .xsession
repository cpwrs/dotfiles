#!/bin/ksh
# X SESSION CONFIG

# xenodm doesn't use a login shell to run .xsession
# run login shell config
. /home/carson/.profile

# set background
xsetroot -solid rgb:22/22/22
hsetroot -solid "#222222"

# allow local users to access X
xhost +local

# remap capslock to ctrl
setxkbmap -option 'ctrl:swapcaps'

# start window manager with config
exec spectrwm -c /home/carson/.spectrwm.conf

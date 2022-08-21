#! /bin/bash

sxhkd -c ~/.config/bspwm/sxhkdrc &
xfce4-power-manager &
nitrogen --restore &
picom &
$HOME/.config/polybar/launch.sh &

volumeicon &
sleep 1
killall volumeicon &
sleep 1
volumeicon &

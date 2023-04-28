#! /bin/bash

sxhkd -c ~/.config/bspwm/scripts/sxhkdrc &
./home/chain/.local/bin/batterynotify &
~/.config/polybar/launch.sh &
xsetroot -cursor_name left_ptr &

nitrogen --restore &
xfce4-power-manager &
picom &


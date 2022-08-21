#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

#volumeicon &
#killall volumeicon
#volumeicon &

#nm-applet &
#picom &
##lxsession &
#numlockx &
#flameshot &

#mocicon &
#killall mocicon
#mocicon &
#./Desktop/desktop.sh
#flameshot

#nitrogen --restore &
#./.xmonad/scripts/autostart.sh


run nm-applet &
run pamac-tray &
run xfce4-power-manager &
run volumeicon &
numlockx on &
blueberry-tray &
picom &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &

mocicon &
killall mocicon
mocicon &
./Desktop/desktop.sh
flameshot &
nitrogen --restore &


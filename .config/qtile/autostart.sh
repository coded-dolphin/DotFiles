#!/bin/sh
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

picom &
nitrogen --restore &
run volumeicon &
nm-applet &
spotifyd &
flameshot &
numlockx on &
run pamac-tray &

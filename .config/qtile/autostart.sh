#!/bin/sh
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

picom &
run flameshot &
run nm-applet &
run volumeicon &
numlockx on &

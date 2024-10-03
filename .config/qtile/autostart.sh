#!/bin/sh
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

picom &
flameshot &
numlockx on &

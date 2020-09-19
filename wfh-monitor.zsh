#!/bin/zsh
xrandr --output eDP-1 --mode 3840x2160 --pos 0x0 --scale 1x1\
  --output DP-2 --mode 3840x2160 --right-of eDP-1 --primary --scale 1x1

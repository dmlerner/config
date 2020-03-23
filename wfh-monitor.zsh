#!/bin/zsh
xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 \
  --output DP-2 --mode 3840x2160 --primary --right-of eDP-1 \
  --output HDMI-1 --mode 3840x2160 --rotate right --right-of DP-2

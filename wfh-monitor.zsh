#!/bin/zsh
xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 \
  --output HDMI-2 --mode 3840x2160 --primary --right-of eDP-1

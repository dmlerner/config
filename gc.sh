#!/usr/bin/zsh
pkill ssh-agent
eval $(ssh-agent -s)
gcert

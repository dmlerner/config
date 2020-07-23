#!/usr/bin/zsh
#./gc.sh
pkill ssh-agent
eval $(ssh-agent -s)
gcert
ssh davidlerner1.irv.corp.google.com
#\ -t -- /usr/bin/zsh -c "prodcertstatus || prodaccess ; tmux attach"

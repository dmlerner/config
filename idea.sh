#!/usr/bin/sh
./gc.sh
ssh davidlerner1.irv.corp.google.com -t "/usr/bin/zsh -l" -Y -C -o ControlPath=none "/opt/intellij-ce-stable/bin/idea.sh"
#\
#  -t -- /usr/bin/zsh -c "prodcertstatus || prodaccess ; tmux attach"

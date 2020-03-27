set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-pain-control'
set -g @plugin 'tmux-plugins/tmux-copycat'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmux-logging'
set -g @plugin 'tmux-plugins/tmux-fpp'
set -g @plugin 'tmux-plugins/vim-tmux-focus-events'
set -g @plugin 'tmux-plugins/tmux-urlview'

set -g default-terminal "screen-256color"
bind v swap-pane -s '!' -t $TMUX_PANE
setw -g mode-keys vi
set -g focus-events on
set-option -sa terminal-overrides ',zsh:RGB'

run -b '~/.tmux/plugins/tpm/tpm'

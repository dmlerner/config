# Config that is very close to a i3 window manager's keybinding.

set -s escape-time 0
setw -g aggressive-resize on

# First remove *all* keybindings
unbind-key -a

# List keys
bind-key ? list-keys

# Copy mode
bind-key [ copy-mode

# Paste buffer
bind-key ] paste-buffer

# Refresh client
bind-key r refresh-client \; display-message "Refresh already"

# Start with index 1
set -g base-index 1
setw -g pane-base-index 1

# Set new prefix
# Note : you can press super key by set M.
# (tested with tty only)
set -g prefix M-Space
bind-key Space send-prefix

# Clock
setw -g clock-mode-style 24

# Config Reloads
bind R source-file ~/.tmux.conf \; display-message "Config reloaded"

# Mouse on/off
set -g mouse off

# Split window
bind-key \; split-window -h
bind-key v split-window -v

# Rotate Window
bind-key -n M-o rotate-window

# Swap pane
bind-key -r H swap-pane -L
bind-key -r J swap-pane -D
bind-key -r K swap-pane -U
bind-key -r L swap-pane -R

# Move pane with Alt (no prefix)
bind-key -n M-h select-pane -L
bind-key -n M-j select-pane -D
bind-key -n M-k select-pane -U
bind-key -n M-l select-pane -R

# Resize pane with Alt (prefix with repeat)
bind-key -r h resize-pane -L 5 \; display-message "Resize left"
bind-key -r j resize-pane -D 5 \; display-message "Resize down"
bind-key -r k resize-pane -U 5 \; display-message "Resize up"
bind-key -r l resize-pane -R 5 \; display-message "Resize right"

# Automatically set window title
set-window-option -g automatic-rename on
set-option -g set-titles on

# Choose Window
bind-key w choose-window

# New Window with number
bind-key 1 new-window -t 1
bind-key 2 new-window -t 2
bind-key 3 new-window -t 3
bind-key 4 new-window -t 4
bind-key 5 new-window -t 5
bind-key 6 new-window -t 6
bind-key 7 new-window -t 7
bind-key 8 new-window -t 8
bind-key 9 new-window -t 9
bind-key 0 new-window -t 10

# Kill Selected Pane
bind-key Q kill-pane

# Switch windows alt+number
bind-key -n M-1 if-shell 'tmux select-window -t 1' '' 'new-window -t 1'
bind-key -n M-2 if-shell 'tmux select-window -t 2' '' 'new-window -t 2'
bind-key -n M-3 if-shell 'tmux select-window -t 3' '' 'new-window -t 3'
bind-key -n M-4 if-shell 'tmux select-window -t 4' '' 'new-window -t 4'
bind-key -n M-5 if-shell 'tmux select-window -t 5' '' 'new-window -t 5'
bind-key -n M-6 if-shell 'tmux select-window -t 6' '' 'new-window -t 6'
bind-key -n M-7 if-shell 'tmux select-window -t 7' '' 'new-window -t 7'
bind-key -n M-8 if-shell 'tmux select-window -t 8' '' 'new-window -t 8'
bind-key -n M-9 if-shell 'tmux select-window -t 9' '' 'new-window -t 9'
bind-key -n M-0 if-shell 'tmux select-window -t 10' '' 'new-window -t 10'


# Change current pane to next window
bind-key 1 if-shell 'tmux join-pane -t :1' '' 'new-window -d -t 1; join-pane -t :1 ; kill-pane -a'
bind-key 2 if-shell 'tmux join-pane -t :2' '' 'new-window -d -t 2; join-pane -t :2 ; kill-pane -a'
bind-key 3 if-shell 'tmux join-pane -t :3' '' 'new-window -d -t 3; join-pane -t :3 ; kill-pane -a'
bind-key 4 if-shell 'tmux join-pane -t :4' '' 'new-window -d -t 4; join-pane -t :4 ; kill-pane -a'
bind-key 5 if-shell 'tmux join-pane -t :5' '' 'new-window -d -t 5; join-pane -t :5 ; kill-pane -a'
bind-key 6 if-shell 'tmux join-pane -t :6' '' 'new-window -d -t 6; join-pane -t :6 ; kill-pane -a'
bind-key 7 if-shell 'tmux join-pane -t :7' '' 'new-window -d -t 7; join-pane -t :7 ; kill-pane -a'
bind-key 8 if-shell 'tmux join-pane -t :8' '' 'new-window -d -t 8; join-pane -t :8 ; kill-pane -a'
bind-key 9 if-shell 'tmux join-pane -t :9' '' 'new-window -d -t 9; join-pane -t :9 ; kill-pane -a'
bind-key 0 if-shell 'tmux join-pane -t :10' '' 'new-window -d -t 10; join-pane -t :10 ; kill-pane -a'

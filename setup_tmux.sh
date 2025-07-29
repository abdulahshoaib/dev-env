#!/usr/bin/env bash

tee ~/.tmux.conf > /dev/null <<EOF
# Indexing to 1
set -g base-index 1
setw -g pane-base-index 1

# Mouse + scroll
set -g mouse on

# TPM Plugin Manager
set -g @plugin 'tmux-plugins/tpm'

# Recommended plugins
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-battery'
set -g @plugin 'tmux-plugins/tmux-cpu'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'

set -g status-right "#{battery_status} #{battery_percentage} | %Y-%m-%d %H:%M"

# Storing & Restoring sessions
set -g @plugin 'tmux-plugins/tmux-resurrect'

# Autosave
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @continuum-restore 'on'
set -g @continuum-save-interval '15'

# Powerline-style theme
set -g @plugin 'jimeh/tmux-themepack'
set -g @themepack 'powerline/double/orange'
setw -g monitor-activity on
set -g visual-activity on

# Initialize TPM (keep at end)
run '~/.tmux/plugins/tpm/tpm'
EOF

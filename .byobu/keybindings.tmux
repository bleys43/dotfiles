bind t select-pane -D
bind n select-pane -U
bind s select-pane -R
bind h select-pane -L
bind l choose-session
set -g mode-keys vi
bind -t vi-copy k jump-to-forward
bind -t vi-copy t cursor-down
bind -t vi-copy n cursor-up
bind -t vi-copy s cursor-right
bind -t vi-copy j search-again
unbind-key -n C-a
unbind-key -n C-b
set -g prefix ^B
set -g prefix2 ^B
bind b send-prefix

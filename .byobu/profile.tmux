source $BYOBU_PREFIX/share/byobu/profiles/tmux
set-option -g default-terminal "screen-256color"
set-option -g set-titles on
set-option -g set-titles-string "#T"
set-option -g status off
set-option -g terminal-overrides "xterm*:XT:smcup@:rmcup@"
bind-key -t vi-copy t cursor-down
bind-key -t vi-copy n cursor-up
bind-key -t vi-copy s cursor-right
bind-key -t vi-choice t down
bind-key -t vi-choice n up
# move x clipboard into tmux paste buffer
bind p run "tmux set-buffer \"$(xclip -o)\"; tmux paste-buffer"
# move tmux copy buffer into x clipboard
bind y run "tmux save-buffer - | xsel -ib;tmux save-buffer - | xsel -ip"
bind l list-windows
#set -g default-terminal 'screen-noit'
set -g pane-border-fg magenta
set -g pane-active-border-fg red
set -g pane-active-border-bg default

if not set -q TMUX
    set -g TMUX tmux -2 new-session -d -s base
    eval $TMUX
    tmux -2 attach-session -d -t base
end

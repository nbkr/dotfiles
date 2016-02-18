# Start Tmux if it is available
# if the session is already running, just attach to it.
SESSION=Default
TMUX=/usr/bin/tmux

if [ -f $TMUX ]; then

    $TMUX has-session -t $SESSION
    if [ $? -eq 0 ]; then
        echo "Session $SESSION already exists. Attaching."
        sleep 1
        $tmux attach -t $SESSION
    fi

    $TMUX new-session -d -s $SESSION
    $TMUX attach -t $SESSION
fi


alias vi=vim

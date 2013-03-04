#! /bin/sh

SESSION='irc'

tmux has-session -t $SESSION

if [ $? != 0 ]; then
	tmux new-session -s $SESSION -d irssi
	#tmux split-window -v -d "cat ~/.irssi/nicklistfifo"
	#tmux set-option -t $SESSION status off
fi

tmux attach -t $SESSION

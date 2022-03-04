#!/bin/zsh                                                                                                   

SESSIONNAME="demon"
tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ] 
 then
	# Use -d to allow the rest of the function to run
    tmux new-session -s $SESSIONNAME -n status -d
    tmux new-window -n te5t
	tmux new-window -n blog

	tmux select-window -t status
	tmux split-window -v
	tmux split-window -h
	tmux select-pane -t 1
	tmux split-window -h
	tmux select-pane -t 1
	tmux send-keys -t $SESSIONNAME:status.1 "watch sensors" C-m
	tmux select-pane -t 2
	tmux send-keys -t $SESSIONNAME:status.2 "htop" C-m
	#tmux select-pane -t 3
	#tmux send-keys -t $SESSIONNAME:status.3 "" C-m
	tmux select-pane -t 4
	tmux send-keys -t $SESSIONNAME:status.4 "nyancat" C-m

	tmux select-window -t te5t
	tmux split-window -v
	tmux split-window -h
	tmux select-pane -t 1
	tmux split-window -h
	tmux select-pane -t 1
	tmux send-keys -t $SESSIONNAME:status.1 "sudo pm2 log" C-m
	#tmux select-pane -t 2
	#tmux send-keys -t $SESSIONNAME:status.2 "" C-m
	tmux select-pane -t 3
	tmux send-keys -t $SESSIONNAME:status.3 "cd /opt/te5t/public/stylesheets" C-m
	tmux send-keys -t $SESSIONNAME:status.3 "node-sass -w scss/style.scss css/style.css --output-style compressed" C-m
	tmux select-pane -t 4
	tmux send-keys -t $SESSIONNAME:status.4 "cd /opt/te5t/public/stylesheets" C-m
	tmux send-keys -t $SESSIONNAME:status.4 "node-sass -w scss/mobile_style.scss css/mobile_style.css --output-style compressed" C-m

	tmux select-window -t blog
	tmux split-window -v
	tmux split-window -h
	tmux select-pane -t 1
	tmux split-window -h
	tmux select-pane -t 1
	#tmux send-keys -t $SESSIONNAME:status.1 "cd /opt/o5e.org" C-m
	#tmux send-keys -t $SESSIONNAME:status.1 "bundle exec jekyll serve" C-m

	tmux new-session -s live -n temp -d 
fi

#tmux attach -t live

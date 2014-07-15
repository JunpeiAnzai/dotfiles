 #!/bin/sh

 DATE=`date "+%Y-%m-%d"`
 LOG_DIR=$HOME/var/tmux/log/$DATE
 LOG_FILE=$LOG_DIR/tmux-$DATE-$1.log
 mkdir -p $LOG_DIR
 tmux display-message "Started logging to $LOG_FILE"
 cat >> $LOG_FILE
 

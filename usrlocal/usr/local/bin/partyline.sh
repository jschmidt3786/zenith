#!/bin/sh
/usr/local/bin/tmux -l -S /tmp/tmux-share new-session -t party -d
sleep 1
chmod 770 /tmp/tmux-share
chgrp staff /tmp/tmux-share


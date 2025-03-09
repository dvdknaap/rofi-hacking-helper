#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "ls -la /etc/cron.*/ && cat /etc/crontab"
for PORT in {0..1000}; do timeout 1 bash -c "</dev/tcp/172.16.1.10/$PORT &>/dev/null" 2>/dev/null && echo "port $PORT is open"; done
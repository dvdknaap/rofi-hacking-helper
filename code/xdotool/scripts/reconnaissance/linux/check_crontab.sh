#!/bin/bash

: '
search for crontabs
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "ls -la /etc/cron.*/ && cat /etc/crontab"
#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='ls -la /etc/cron.*/ && cat /etc/crontab'
paste_command "${command}"

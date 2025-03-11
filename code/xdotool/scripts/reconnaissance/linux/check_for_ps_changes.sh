#!/bin/bash

: '
refresh ps -aux list every second
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command 'watch -n 1 "ps -aux"'

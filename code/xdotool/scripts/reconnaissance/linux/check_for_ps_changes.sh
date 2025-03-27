#!/bin/bash

: '
refresh ps -aux list every second
'

paste_command 'watch -n 1 "ps -aux"'
xdotool key Return

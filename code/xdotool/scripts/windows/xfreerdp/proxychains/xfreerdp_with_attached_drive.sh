#!/bin/bash

: '
xfreerdp: Connect, map drive 'tools' to current directory (check `net use` for the location).
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/run_with_proxychains.sh

run_with_proxychains $0
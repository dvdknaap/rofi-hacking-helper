#!/bin/bash

: '
show user .bash* content
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "tail -n5 /home/*/.bash*"

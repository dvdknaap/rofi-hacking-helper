#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='tail -n5 /home/*/.bash*'
paste_command "${command}"

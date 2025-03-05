#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='watch -n 1 "ps -aux | grep pass"'
paste_command "${command}"

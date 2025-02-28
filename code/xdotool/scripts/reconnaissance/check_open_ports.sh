#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='netstat -tpln'
paste_command "${command}"

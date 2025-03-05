#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='for i in $(seq 254); do ping 172.16.8.$i -c1 -W1 & done | grep from'
paste_command "${command}"

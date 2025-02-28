#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='for /L %i in (1 1 254) do ping 172.16.5.%i -n 1 -w 100 | find "Reply"'
paste_command "${command}"

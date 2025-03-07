#!/bin/bash

: '
start http server
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "python3 -m http.server 1337"

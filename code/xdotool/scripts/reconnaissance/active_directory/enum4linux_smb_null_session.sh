#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='/usr/bin/enum4linux -U -P 172.16.8.3'
paste_command "${command}"

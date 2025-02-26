#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='rlwrap -cAr nc -lvnp 1337'
paste_command "${command}"

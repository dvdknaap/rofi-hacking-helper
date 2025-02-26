#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='nc -lvnp 1337'
paste_command "${command}"

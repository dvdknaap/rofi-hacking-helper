#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='find /home/* -type f -name "*.txt" -o ! -name "*.*"'
paste_command "${command}"

#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='nmap --open -oA nmap_1k -iL scope.txt'
paste_command "${command}"

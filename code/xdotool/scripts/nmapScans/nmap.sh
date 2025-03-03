#!/bin/bash

"""
Nmap: Aggressive scan all ports, save output.
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='nmap -p- -sC -A -T4 -vvv --min-parallelism 10  --min-rate 1000 -oA nmap -Pn '
paste_command "${command}"

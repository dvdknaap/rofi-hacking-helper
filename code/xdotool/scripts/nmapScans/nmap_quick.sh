#!/bin/bash

"""
Nmap: Scan hosts from scope.txt, save output to nmap_1k.
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='nmap --open -oA nmap_1k -iL scope.txt'
paste_command "${command}"

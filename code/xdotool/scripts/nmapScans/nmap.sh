#!/bin/bash

: '
Nmap: Aggressive scan all ports, save output.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "nmap -p- -sC -A -T4 -vvv --min-parallelism 10  --min-rate 1000 -oA documentation/evidence/scans/serviceEnumeration/nmap -Pn "

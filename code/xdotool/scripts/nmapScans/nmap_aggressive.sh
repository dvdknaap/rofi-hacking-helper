#!/bin/bash

: '
Nmap: Aggressive scan all ports, save output.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP"

IP=${form_data["IP"]}

paste_command "nmap -p- -sC -A -T4 -vvv --min-parallelism 10  --min-rate 1000 -oA documentation/evidence/scans/serviceEnumeration/nmap -Pn ${IP}"
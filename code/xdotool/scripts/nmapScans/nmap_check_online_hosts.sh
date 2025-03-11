#!/bin/bash

: '
Nmap: ping sweep
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Ip range"

IPRANGE=${form_data["Ip range"]}

paste_command "nmap -sn -T4 ${IPRANGE} -oN documentation/evidence/scans/serviceEnumeration/active-hosts"
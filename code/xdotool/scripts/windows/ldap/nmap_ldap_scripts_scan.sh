#!/bin/bash

: '
nmap scan with ldap scripts
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form '{"label": "IP address", "type": "text", "name": "IP"}'

IP=${form_data["IP"]}

paste_command "nmap -n -sV --script "ldap* and not brute" ${IP}"
xdotool key Return
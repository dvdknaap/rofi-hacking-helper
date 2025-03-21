#!/bin/bash

: '
Impacket: GetADUsers.py get domain users
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form  "IP" "Domain" "Username" "Password"

HASH=${form_data["Hash"]}
DOMAIN=${form_data["Domain"]}
USERNAME=${form_data["Username"]}
PASSWORD=${form_data["Password"]}
IP=${form_data["IP"]}

paste_command "GetADUsers.py -all ${DOMAIN}/${USERNAME} -dc-ip ${IP}"
xdotool key Return
sleep 1

paste_command "${PASSWORD}"
xdotool key Return
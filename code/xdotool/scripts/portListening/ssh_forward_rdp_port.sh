#!/bin/bash

: '
ssh: forward RDP port with id_rsa file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "username" "id_rsa file" "internal IP" "local port"

IP=${form_data["IP"]}
USERNAME=${form_data["username"]}
INERNAL_PORT=${form_data["internal IP"]}
ID_RSA_FILE=${form_data["id_rsa file"]}
LOCAL_PORT=${form_data["local port"]}

paste_command "ssh -L ${LOCAL_PORT}:${INERNAL_PORT}:3389 -i ${ID_RSA_FILE} ${USERNAME}@${IP}"

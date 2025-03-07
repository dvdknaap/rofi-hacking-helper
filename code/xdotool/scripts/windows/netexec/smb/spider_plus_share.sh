#!/bin/bash

: '
netexec smb use spider_plus to get all share files
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "Username" "Password" "Share"

IP=${form_data["IP"]}
USERNAME=${form_data["Username"]}
PASSWORD=${form_data["Password"]}
SHARE=${form_data["Share"]}

paste_command "netexec smb ${IP} -u '${USERNAME}' -p '${PASSWORD}' -M spider_plus --share '${SHARE}'"

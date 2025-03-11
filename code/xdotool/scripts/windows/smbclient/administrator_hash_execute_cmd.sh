#!/bin/bash

: '
smbclient: Connect to share.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "Username" "Password" "Share"

IP=${form_data["IP"]}
USERNAME=${form_data["Username"]}
SHARE=${form_data["Share"]}

paste_command "smbclient -U ${USERNAME} '//${IP}/${SHARE}'"


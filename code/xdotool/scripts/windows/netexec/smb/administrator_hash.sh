#!/bin/bash

: '
check if smb is possible for administrator hash
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form '{"label": "IP address", "type": "text", "name": "ip"}' '{"label": "Hash", "type": "text", "name": "hash"}'

IP=${form_data["ip"]}
HASH=${form_data["hash"]}

paste_command "netexec smb ${IP} -u administrator -H ${HASH}"
#!/bin/bash

: '
smbclient: Connect to share anonymous.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form '{"label": "IP address", "type": "text", "name": "IP"}' "Share"

IP=${form_data["IP"]}
SHARE=${form_data["Share"]}

paste_command "smbclient //${IP}/${SHARE}/"
xdotool key Return
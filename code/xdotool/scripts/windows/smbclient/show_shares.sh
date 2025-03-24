#!/bin/bash

: '
smbclient: List shares.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form '{"label": "IP address", "type": "text", "name": "IP"}'

IP=${form_data["IP"]}

paste_command "smbclient -L ${IP}"
xdotool key Return
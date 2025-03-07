#!/bin/bash

: '
xfreerdp: Connect, map drive 'tools' to current directory (check `net use` for the location).
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "Username" "Password"

IP=${form_data["IP"]}
USERNAME=${form_data["Username"]}
PASSWORD=${form_data["Password"]}

paste_command "xfreerdp3 /u:'${USERNAME}' /p:'${PASSWORD}' /v:${IP} /cert:ignore /smart-sizing /size:1920x1080 /drive:tools,\"./tools\""

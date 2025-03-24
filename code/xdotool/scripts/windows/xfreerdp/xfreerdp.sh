#!/bin/bash

: '
xfreerdp: Connect with specified credentials.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form '{"label": "IP address", "type": "text", "name": "IP"}''{"label": "Username", "type": "text", "name": "Username"}'"Password"

IP=${form_data["IP"]}
USERNAME=${form_data["Username"]}
PASSWORD=${form_data["Password"]}

paste_command "xfreerdp3 /u:'${USERNAME}' /p:'${PASSWORD}' /v:${IP} /cert:ignore /smart-sizing /size:1920x1080"

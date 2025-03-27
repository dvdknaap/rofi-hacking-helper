#!/bin/bash

: '
Net: Add use, add to administrators and RDP groups.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form'{"label": "Username", "type": "text", "name": "Username"}'"Password"

USERNAME=${form_data["Username"]}
PASSWORD=${form_data["Password"]}

paste_command "net user ${USERNAME} ${PASSWORD} /add && net localgroup administrators ${USERNAME} /add && net localgroup \"Remote Desktop Users\" ${USERNAME} /add"
xdotool key Return

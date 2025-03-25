#!/bin/bash

: '
enumerate over ad users and password file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form '{"label": "IP address", "type": "text", "name": "IP"}''{"label": "Username", "type": "text", "name": "Username"}'"Password"

IP=${form_data["IP"]}
USERNAME=${form_data["Username"]}
PASSWORD=${form_data["Password"]}

paste_command "netexec smb ${IP} -u ${USERNAME} -p ${PASSWORD}"
#!/bin/bash

: '
nxc winrm: Check WinRM connection with username and password.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form '{"label": "IP address", "type": "text", "name": "IP"}''{"label": "Username", "type": "text", "name": "username"}'"password"

IP=${form_data["IP"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}

paste_command "netexec winrm ${IP} -u ${USERNAME} -p ${PASSWORD} | grep '[+]'"
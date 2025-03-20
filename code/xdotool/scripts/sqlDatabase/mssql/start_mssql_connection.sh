#!/bin/bash

: '
start a mssql connection
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "Username" "Password"

IP=${form_data["IP"]}
USERNAME=${form_data["Username"]}
PASSWORD=${form_data["Password"]}

paste_command "mssqlclient.py -port 1433 ${USERNAME}:'${PASSWORD}'@${IP}"
xdotool key Return

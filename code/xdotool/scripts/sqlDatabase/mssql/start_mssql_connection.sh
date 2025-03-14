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

paste_command " mssqlclient.py Sophie:TerrorInflictPurpleDirt996655@172.16.1.5"
xdotool key Return

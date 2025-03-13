#!/bin/bash

: '
FTP: login with username and password
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "username" "password"

IP=${form_data["IP"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}

paste_command "ftp ${IP}"
xdotool key Return
sleep 1

paste_command "${USERNAME}"
xdotool key Return
sleep 1

paste_command "${PASSWORD}"
xdotool key Return
sleep 1

paste_command "ls"
xdotool key Return
sleep 1
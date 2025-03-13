#!/bin/bash

: '
login with username file and password file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "Username" "Password file"

IP=${form_data["IP"]}
USERNAME=${form_data["Username file"]}
PASSWORD=${form_data["Password file"]}

paste_command "netexec ftp ${IP} -u '${USERNAME}' -p '${PASSWORD}'"
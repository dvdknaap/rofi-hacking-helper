#!/bin/bash

: '
hydra: bruteforce username and passwords
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "Username" "Password"

IP=${form_data["IP"]}
USERNAME=${form_data["Username"]}
PASSWORD=${form_data["Password"]}

paste_command "hydra -L ${USERNAME} -P ${PASSWORD} ${IP} ftp -V"
xdotool key Return
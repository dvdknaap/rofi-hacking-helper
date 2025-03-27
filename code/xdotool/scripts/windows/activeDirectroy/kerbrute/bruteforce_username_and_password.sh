#!/bin/bash

: '
kerbrute: user enumerate on DC
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Domain" "IP" "Username file"

DOMAIN=${form_data["Domain"]}
IP=${form_data["IP"]}
USERNAME_FILE=${form_data["Username file"]}

paste_command "/opt/windows/kerbrute userenum -d ${DOMAIN} --dc ${IP} ${USERNAME_FILE} -v"
xdotool key Return
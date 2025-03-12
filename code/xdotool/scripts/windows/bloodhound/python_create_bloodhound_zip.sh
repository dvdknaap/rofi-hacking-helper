#!/bin/bash

: '
Create a bloodhound zip with bloodhound-python
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Username" "Password" "Domain" "DC" "NsIP"

USERNAME=${form_data["Username"]}
PASSWORD=${form_data["Password"]}
DOMAIN=${form_data["Domain"]}
DC=${form_data["DC"]}
NSIP=${form_data["NsIP"]}

paste_command "bloodhound-python -u '${USERNAME}' -p '${PASSWORD}' -d ${DOMAIN} -c All -dc ${DC} -ns ${NSIP} --dns-tcp --zip"
xdotool key Return
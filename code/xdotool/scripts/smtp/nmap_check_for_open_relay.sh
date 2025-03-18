#!/bin/bash

: '
nmap: check for smtp open relay
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "domain"

IP=${form_data["IP"]}
DOMAIN=${form_data["domain"]}

paste_command "nmap ${IP} -p25 --script smtp-open-relay -v"

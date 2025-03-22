#!/bin/bash

: '
Nmap: Scan hosts from scope.txt, save output to nmap_1k.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "hosts file"

HOSTS_FILE=${form_data["hosts file"]}

paste_command "nmap --open -oA nmap_1k -iL ${HOSTS_FILE}"

#!/bin/bash

: '
Nmap: ping sweep
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Ip range" "output filename"

IPRANGE=${form_data["Ip range"]}
OUTPUT_FILENAME=${form_data["output filename"]}

paste_command "nmap -sn -T4 ${IPRANGE} -oN ${OUTPUT_FILENAME}"
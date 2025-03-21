#!/bin/bash

: '
Run Snaffler on inlanefreight.local domain.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Domain" "output file"

DOMAIN=${form_data["Domain"]}
OUTPUT_FILE=${form_data["output file"]}

paste_command "Snaffler.exe -s -d ${DOMAIN} -o ${OUTPUT_FILE} -v data"
xdotool key Return

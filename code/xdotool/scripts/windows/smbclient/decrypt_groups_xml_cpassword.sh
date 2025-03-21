#!/bin/bash

: '
decrypt cpassword from groups.xml
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "cpassword"

CPASSWORD=${form_data["cpassword"]}

paste_command "gpp-decrypt ${CPASSWORD}"
xdotool key Return
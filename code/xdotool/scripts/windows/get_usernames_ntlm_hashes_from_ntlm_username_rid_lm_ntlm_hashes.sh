 #!/bin/bash

: '
save username and ntlm hashes in seperated files from form username:RID:LM:NTLM:::
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "NTLM file" "Username output file" "Hashes output file"

NTLM_FILE=${form_data["NTLM file"]}
USERNAME_OUTPUT_FILE=${form_data["Username output file"]}
HASHES_OUTPUT_FILE=${form_data["Hashes output file"]}

paste_command "cat ${NTLM_FILE} | cut -d ':' -f 1 > ${USERNAME_OUTPUT_FILE}; cat ${NTLM_FILE} | cut -d ':' -f 4 > ${HASHES_OUTPUT_FILE}"

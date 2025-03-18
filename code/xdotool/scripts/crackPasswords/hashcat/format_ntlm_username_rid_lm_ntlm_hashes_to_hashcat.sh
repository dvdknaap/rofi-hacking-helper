 #!/bin/bash

: '
Format username:RID:LM:NTLM::: to hashcat format
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "hash file"

HASH_FILE=${form_data["hash file"]}

paste_command "cat ${HASH_FILE} | cut -d ':' -f 1,4 > hashes.txt"

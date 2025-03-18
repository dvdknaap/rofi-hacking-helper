 #!/bin/bash

: '
crack ntlm hashes
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "hash file"

HASH_FILE=${form_data["hash file"]}

paste_command "john --wordlist=/usr/share/wordlists/rockyou.txt --format=NT ${HASH_FILE}"
xdotool key Return
sleep 2
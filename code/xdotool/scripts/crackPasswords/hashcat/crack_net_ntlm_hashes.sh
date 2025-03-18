 #!/bin/bash

: '
Crack NTLM hashes with hashcat using rockyou.txt.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "hash file"

HASH_FILE=${form_data["hash file"]}

paste_command "hashcat -m 1000 -O -w 3 ${HASH_FILE} /usr/share/wordlists/rockyou.txt"

 #!/bin/bash

: '
unshadow /etc/passwords
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "etcPasswd file" "shadow file"

ETCPASSWD_FILE=${form_data["etcPasswd file"]}
SHADOW_FILE=${form_data["shadow file"]}

paste_command "unshadow ${ETCPASSWD_FILE} ${SHADOW_FILE} > unshadow.txt"
xdotool key Return
sleep 2

paste_command "john --wordlist=/usr/share/wordlists/rockyou.txt unshadow.txt"
xdotool key Return
sleep 2
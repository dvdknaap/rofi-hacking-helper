 #!/bin/bash

: '
Crack SPN passwords with hashcat using rockyou.txt.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "spn file"

SPN_FILE=${form_data["spn file"]}

paste_command "hashcat -m 13100 -O -w 3 ${SPN_FILE} /usr/share/wordlists/rockyou.txt"
xdotool key Return

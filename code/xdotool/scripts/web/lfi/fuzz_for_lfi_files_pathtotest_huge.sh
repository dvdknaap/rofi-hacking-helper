#!/bin/bash

: '
fuzz for LFI files with /usr/share/seclists/Fuzzing/LFI/LFI-Jhaddix.txt
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website"

WEBSITE=${form_data["Website"]}

paste_command "ffuf -ic -c -w /usr/share/seclists/Fuzzing/LFI/LFI-Jhaddix.txt:FUZZ -u '${WEBSITE}FUZZ' -v -fs 0"
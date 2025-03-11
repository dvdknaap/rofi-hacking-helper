#!/bin/bash

: '
fuzz for PHP value with /usr/share/seclists/Fuzzing/LFI/LFI-Jhaddix.txt
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website"

WEBSITE=${form_data["Website"]}

paste_command "ffuf -w /usr/share/seclists/Fuzzing/LFI/LFI-Jhaddix.txt:FUZZ -u '${WEBSITE}FUZZ'"

#!/bin/bash

: '
Powershell: search for a file or extension *.7z
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "File"

FILE=${form_data["File"]}

paste_command "\Get-ChildItem -Recurse -Include ${FILE} -ErrorAction SilentlyContinue -File"
xdotool key Return
sleep 0.8

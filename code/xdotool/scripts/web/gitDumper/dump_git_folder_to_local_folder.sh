#!/bin/bash

: '
dump git folder to local folder
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website" "Local folder"

WEBSITE=${form_data["Website"]}
LOCAL_FOLDER=${form_data["Local folder"]}

pip3 install git-dumper --break-system-packages

paste_command "git-dumper '${WEBSITE}' ${LOCAL_FOLDER}"

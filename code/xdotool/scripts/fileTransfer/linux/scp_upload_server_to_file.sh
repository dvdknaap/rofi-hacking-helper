#!/bin/bash

: '
SCP upload file to server
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "id_rsa file" "username" "IP" "remote file path" "local path"

ID_RSA_FILE=${form_data["id_rsa file"]}
USERNAME=${form_data["username"]}
IP=${form_data["IP"]}
REMOTE_FILE_PATH=${form_data["remote file path"]}
LOCAL_PATH=${form_data["local path"]}

paste_command "scp -i ${ID_RSA_FILE} ${LOCAL_PATH} ${USERNAME}@${IP}:${REMOTE_FILE_PATH}"
xdotool key Return
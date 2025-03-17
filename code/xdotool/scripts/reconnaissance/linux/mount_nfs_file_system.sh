#!/bin/bash

: '
mount to ip
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "TARGET_DIR"

IP=${form_data["IP"]}
TARGET_DIR=${form_data["TARGET_DIR"]}

paste_command "mkdir ${TARGET_DIR} && sudo mount -t nfs ${IP}:/ ./${TARGET_DIR}/ -o nolock && cd ${TARGET_DIR} && tree ."

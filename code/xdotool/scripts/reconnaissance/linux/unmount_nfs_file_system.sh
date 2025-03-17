#!/bin/bash

: '
unmount ip mount
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "TARGET_DIR"

TARGET_DIR=${form_data["TARGET_DIR"]}

paste_command "sudo umount ${TARGET_DIR}"

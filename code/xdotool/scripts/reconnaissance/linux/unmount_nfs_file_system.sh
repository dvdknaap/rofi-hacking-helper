#!/bin/bash

: '
unmount ip mount
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
TARGET_DIR_FIELD=$(form_item  "target directory" "target_dir")

# Generate GUI form
generate_form "${TARGET_DIR_FIELD}"

TARGET_DIR=${form_data["target_dir"]}

paste_command "sudo umount ${TARGET_DIR}"
xdotool key Return

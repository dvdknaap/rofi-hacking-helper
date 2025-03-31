#!/bin/bash

: '
start a wsgidav server
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PATH_FIELD=$(form_item "root path" "root_path" "./tools")

# Generate GUI form
generate_form "${PATH_FIELD}" 

PATH=${form_data["root_path"]}

paste_command "sudo wsgidav --host=0.0.0.0 --port=80 --root=${PATH} --auth=anonymous"
xdotool key Return

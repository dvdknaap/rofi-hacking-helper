#!/bin/bash

: '
python3: start http server
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item  "port" "number" "port" "80")

# Generate GUI form
generate_form "${PORT_FIELD}"

PORT=${form_data["port"]}

paste_command "python3 -m http.server ${PORT}"
xdotool key Return

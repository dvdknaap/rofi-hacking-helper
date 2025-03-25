#!/bin/bash

: '
start rlwrap nc port listening
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item  "port" "number" "port" "1337")

# Generate GUI form
generate_form "${PORT_FIELD}"

PORT=${form_data["port"]}

paste_command "rlwrap -cAr nc -lvnp ${PORT}"
xdotool key Return

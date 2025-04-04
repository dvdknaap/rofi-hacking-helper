#!/bin/bash

: '
start nc port listening
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item  "port" "number" "port" "1337")

# Generate GUI form
generate_form "${PORT_FIELD}"

PORT=${form_data["port"]}

execute_command "stty raw -echo; (stty size; cat) | nc -lvnp ${PORT}"
create_new_line

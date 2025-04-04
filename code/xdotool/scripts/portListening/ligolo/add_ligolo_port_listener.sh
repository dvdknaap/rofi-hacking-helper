#!/bin/bash

: '
add ligolo port listener
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FROM_PORT_FIELD=$(form_item  "from port" "from_port")
TO_PORT_FIELD=$(form_item  "to port" "to_port")

# Generate GUI form
generate_form "${FROM_PORT_FIELD}" "${TO_PORT_FIELD}"

FROM_PORT=${form_data["from_port"]}
TO_PORT=${form_data["to_port"]}

execute_command "listener_add --addr 0.0.0.0:${FROM_PORT} --to 127.0.0.1:${TO_PORT} --tcp"
create_new_line

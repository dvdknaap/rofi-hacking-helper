#!/bin/bash

: '
ruby: start http server
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item  "port" "number" "port" "80")

# Generate GUI form
generate_form "${PORT_FIELD}"

PORT=${form_data["port"]}

execute_command "ruby -run -ehttpd . -p${PORT}"
create_new_line

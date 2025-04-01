#!/bin/bash

: '
python2.7: start http server
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item  "port" "number" "port" "80")

# Generate GUI form
generate_form "${PORT_FIELD}"

PORT=${form_data["port"]}

execute_command "python2.7 -m SimpleHTTPServer ${PORT}"
create_new_line

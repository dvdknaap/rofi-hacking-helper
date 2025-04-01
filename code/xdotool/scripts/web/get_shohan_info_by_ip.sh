#!/bin/bash

: '
get shohan info by ip
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FILE_FIELD=$(form_item "ip file" "ip_file" "ip-addresses.txt")

# Generate GUI form
generate_form "${IP_FILE_FIELD}"

IP_FILE=${form_data["ip_file"]}

execute_command "for i in $(cat ${IP_FILE});do shodan host \$i;done"
create_new_line

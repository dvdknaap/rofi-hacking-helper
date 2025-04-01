#!/bin/bash

: '
add ip and domains to /etc/hosts
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "ip" "ip" "$(get_dynamic_field "ip")")
DOMAINS_FIELD=$(form_item  "domains" "domains" "$(get_dynamic_field "domain") $(get_dynamic_field "dc")")

# Generate GUI form
generate_form "${IP_FIELD}" "${DOMAINS_FIELD}"

IP=${form_data["ip"]}
DOMAINS=${form_data["domains"]}

execute_command "echo \"${IP}\\t${DOMAINS}\\n\\n\" | sudo tee -as /etc/hosts"
create_new_line

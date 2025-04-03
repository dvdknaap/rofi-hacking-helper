#!/bin/bash

: '
add ip and domains to /etc/hosts
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "ip" "ip" "$(get_dynamic_field "ip")")
DOMAINS_FIELD=$(form_item  "domains" "domains" "$(get_dynamic_field "domain") $(get_dynamic_field "dc")")
WEBSITE_FIELD=$(form_item  "website" "website" "$(get_dynamic_field "website")")

# Generate GUI form
generate_form "${IP_FIELD}" "${DOMAINS_FIELD}" "${WEBSITE_FIELD}"

IP=${form_data["ip"]}
DOMAINS=${form_data["domains"]}
WEBSITE=${form_data["website"]}

WEBSITE=$(echo "${WEBSITE}" | sed -E 's/^\s*.*:\/\/www.//g' | sed -E 's/^\s*.*:\/\///g')

execute_command "echo \"${IP}\\t${DOMAINS} ${WEBSITE}\\n\\n\" | sudo tee -a /etc/hosts"
create_new_line

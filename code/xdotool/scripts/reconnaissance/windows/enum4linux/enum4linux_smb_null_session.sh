#!/bin/bash

: '
Enumerate users and passwords via enum4linux.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")

# Generate GUI form
generate_form "${IP_FIELD}"

IP=${form_data["ip"]}

execute_command "/usr/bin/enum4linux -A -U -P ${IP}"
create_new_line

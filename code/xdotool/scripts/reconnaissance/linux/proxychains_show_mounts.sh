#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command=$(cat <<'EOF'
proxychains showmount -e 172.16.8.20
EOF
)
paste_command "${command}"

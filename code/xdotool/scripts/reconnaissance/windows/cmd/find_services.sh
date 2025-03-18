#!/bin/bash

: '
Find services
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command=$(cat <<'EOF'
wmic service get name,displayname,pathname,startmode |findstr /i "auto"|findstr /i /v "C:\windows\\" |findstr /i /v """
EOF
)
paste_command "${command}"
xdotool key Return

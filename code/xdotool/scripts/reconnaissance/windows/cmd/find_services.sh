#!/bin/bash

: '
Find services
'

command=$(cat <<'EOF'
wmic service get name,displayname,pathname,startmode |findstr /i "auto"|findstr /i /v "C:\windows\\" |findstr /i /v """
EOF
)
paste_command "${command}"
xdotool key Return

#!/bin/bash

: '
Find services
'

command=$(cat <<'EOF'
wmic service get name,displayname,pathname,startmode |findstr /i "auto"|findstr /i /v "C:\windows\\"
EOF
)
execute_command "${command}"
create_new_line

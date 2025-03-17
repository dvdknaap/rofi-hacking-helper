#!/bin/bash

: '
show exports (/etc/exports)
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command=$(cat <<'EOF'
cat /etc/exports
EOF
)
paste_command "${command}"

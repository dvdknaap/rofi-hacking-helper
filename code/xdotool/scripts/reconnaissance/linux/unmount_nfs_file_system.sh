#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command=$(cat <<'EOF'
sudo umount ./target-NFS
EOF
)
paste_command "${command}"

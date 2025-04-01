#!/bin/bash

: '
save SSH key to authorized_keys
'

SSH_KEY=$(cat ~/.ssh/id_ed25519.pub | tr -d '\n')

execute_command "echo '${SSH_KEY}' >> authorized_keys"
create_new_line

#!/bin/bash

: '
get SSH key
'

SSH_KEY=$(cat ~/.ssh/id_ed25519.pub | tr -d '\n')

paste_command "${SSH_KEY}"

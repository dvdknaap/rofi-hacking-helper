#!/bin/bash

: '
Fix Kerberos "Double Hop" problem when using WinRM/Powershell
'

#$SecPassword = ConvertTo-SecureString '!qazXSW@' -AsPlainText -Force
#$Cred = New-Object System.Management.Automation.PSCredential('INLANEFREIGHT\backupadm', $SecPassword)

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item  "domain" "domain")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}"

DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}

paste_command "\$SecPassword = ConvertTo-SecureString '${PASSWORD}' -AsPlainText -Force"
xdotool key Return
sleep 1

paste_command "\$Cred = New-Object System.Management.Automation.PSCredential('${usernaDOMAINme}\\${PASSWORD}', \$SecPassword)"
xdotool key Return
sleep 1

paste_command "get-domainuser -spn -credential \$Cred | select samaccountname"
xdotool key Return
sleep 1


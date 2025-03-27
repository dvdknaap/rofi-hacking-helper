#!/bin/bash

: '
Fix Kerberos "Double Hop" problem when using WinRM/Powershell
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

#$SecPassword = ConvertTo-SecureString '!qazXSW@' -AsPlainText -Force
#$Cred = New-Object System.Management.Automation.PSCredential('INLANEFREIGHT\backupadm', $SecPassword)

username=$(echo "" | rofi -dmenu -p "Domain\username:"); echo ""
password=$(echo "" | rofi -dmenu -p "Password:"); echo ""

paste_command "\$SecPassword = ConvertTo-SecureString '${password}' -AsPlainText -Force"
xdotool key Return
sleep 1

paste_command "\$Cred = New-Object System.Management.Automation.PSCredential('${username}', \$SecPassword)"
xdotool key Return
sleep 1

paste_command "get-domainuser -spn -credential \$Cred | select samaccountname"
xdotool key Return
sleep 1


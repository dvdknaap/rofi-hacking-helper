#!/bin/bash

: '
PowerShell: Force change password for user.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "Set-DomainUserPassword -Identity ssmalls -AccountPassword (ConvertTo-SecureString 'Str0ngpass86!' -AsPlainText -Force ) -Verbose"


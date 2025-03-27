#!/bin/bash

: '
PowerShell: Get SPN user account names.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "Get-DomainUser * -spn | select samaccountname"
xdotool key Return

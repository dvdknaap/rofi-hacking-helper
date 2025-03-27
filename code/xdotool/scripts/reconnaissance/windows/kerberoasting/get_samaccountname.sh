#!/bin/bash

: '
PowerShell: Get SPN user account names.
'

paste_command "Get-DomainUser * -spn | select samaccountname"
xdotool key Return

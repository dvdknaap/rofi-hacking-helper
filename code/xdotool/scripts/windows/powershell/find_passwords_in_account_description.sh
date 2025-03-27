#!/bin/bash

: '
PowerShell: Get users with non-null descriptions.
'

paste_command 'Get-DomainUser * |select samaccountname,description | ?{$_.Description -ne $null}'
xdotool key Return

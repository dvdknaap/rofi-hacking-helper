#!/bin/bash

: '
Powershell: Check default username
'

paste_command "Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\' -Name \"DefaultUserName\""
xdotool key Return

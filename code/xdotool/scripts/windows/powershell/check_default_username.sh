#!/bin/bash

: '
Powershell: Check default username
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\' -Name \"DefaultUserName\""
xdotool key Return

#!/bin/bash

: '
Powershell: Check default username
'

execute_command "Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\' -Name \"DefaultUserName\""
create_new_line

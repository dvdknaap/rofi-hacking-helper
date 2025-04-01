#!/bin/bash

: '
Disable defender in register
'

execute_command "New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name DisableAntiSpyware -Value 1 -PropertyType DWORD -Force"
create_new_line

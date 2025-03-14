#!/bin/bash

: '
Disable defender
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name DisableAntiSpyware -Value 1 -PropertyType DWORD -Force"
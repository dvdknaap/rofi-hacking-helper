#!/bin/bash

"""
Check user permissions and other usefull pentest info
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='Write-Host "`nwhoami:"; whoami /all; Write-Host "`nGet-LocalUser:"; Get-LocalUser; Write-Host "`nGet-ChildItem C:\Users:"; Get-ChildItem C:\Users; Write-Host "`nGet-CimInstance Win32_OperatingSystem:"; Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber; Write-Host "`n[System.Environment]::OSVersion:"; [System.Environment]::OSVersion.VersionString; Write-Host "`nGet-LocalGroupMember Administrators:"; Get-LocalGroupMember Administrators'
paste_command "${command}"

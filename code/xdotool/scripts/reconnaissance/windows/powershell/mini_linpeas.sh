#!/bin/bash

: '
perform mini linpeas to get pentest info
'

paste_command 'Write-Host "`nwhoami:"; whoami /all; Write-Host "`nGet-LocalUser:"; Get-LocalUser; Write-Host "`nGet-ChildItem C:\Users:"; Get-ChildItem C:\Users; Write-Host "`nGet-CimInstance Win32_OperatingSystem:"; Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber; Write-Host "`n[System.Environment]::OSVersion:"; [System.Environment]::OSVersion.VersionString; Write-Host "`nGet-LocalGroupMember Administrators:"; Get-LocalGroupMember Administrators'
xdotool key Return

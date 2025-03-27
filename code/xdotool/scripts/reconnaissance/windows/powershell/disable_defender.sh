#!/bin/bash

: '
Disable Windows Defender and Firewall.
'

paste_command "cmd.exe /c \"C:\Program Files\Windows Defender\MpCmdRun.exe\" -removedefinitions -all"
xdotool key Return

paste_command "Set-MpPreference -DisableIntrusionPreventionSystem \$true -DisableIOAVProtection \$true -DisableRealtimeMonitoring \$true"
xdotool key Return

paste_command "NetSh Advfirewall set allprofiles state off"
xdotool key Return

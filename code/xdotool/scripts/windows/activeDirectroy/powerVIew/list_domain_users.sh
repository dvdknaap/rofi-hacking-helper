#!/bin/bash

: '
creating a List of Domain Users
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "Get-ADUser -Filter * | Select-Object -ExpandProperty SamAccountName > ad_users.txt"
xdotool key Return
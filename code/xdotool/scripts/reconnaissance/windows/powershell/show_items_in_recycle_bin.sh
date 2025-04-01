#!/bin/bash

: '
Powershell: Show Items in recycle bin
'

execute_command "\$shell = New-Object -com shell.application"
create_new_line
sleep 0.8

execute_command "\$rb = \$shell.Namespace(10)"
create_new_line
sleep 0.8

execute_command "\$rb | get-member"
create_new_line
sleep 0.8

execute_command "\$rb.Items() | select -first 2"
create_new_line
sleep 0.8   

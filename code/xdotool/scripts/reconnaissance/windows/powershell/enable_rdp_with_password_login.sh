#!/bin/bash

: '
cmd: enable rdp with password
'

execute_command "Set-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server' -name "fDenyTSConnections" -value 0"
create_new_line

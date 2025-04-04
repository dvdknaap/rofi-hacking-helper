#!/bin/bash

: '
Powershell: enable rdp with password
'

execute_command "reg add "HKLM\System\CurrentControlSet\Control\Terminal Server" /t REG_DWORD /v fDenyTSConnections /d 0.0 /f"
create_new_line

#!/bin/bash

: '
enable restricted admin mode
'

execute_command "reg add HKLM\System\CurrentControlSet\Control\Lsa /t REG_DWORD /v DisableRestrictedAdmin /d 0x0 /f"
create_new_line

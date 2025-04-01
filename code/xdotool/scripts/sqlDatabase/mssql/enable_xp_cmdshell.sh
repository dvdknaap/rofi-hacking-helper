#!/bin/bash

: '
script to enable xp_cmdshell
'

execute_command "EXEC sp_configure 'show advanced options', '1';"
create_new_line
sleep 1

execute_command "RECONFIGURE;"
create_new_line
sleep 1


execute_command "EXEC sp_configure 'xp_cmdshell', '1';"
create_new_line
sleep 1


execute_command "RECONFIGURE;"
create_new_line
sleep 1

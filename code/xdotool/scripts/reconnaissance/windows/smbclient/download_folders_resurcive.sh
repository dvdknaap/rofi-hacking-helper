#!/bin/bash

: '
smbclient: download files recursive
'

execute_command "PROMPT OFF"
create_new_line
sleep 0.8

execute_command "RECURSE ON"
create_new_line
sleep 0.8

execute_command "mget *"
create_new_line

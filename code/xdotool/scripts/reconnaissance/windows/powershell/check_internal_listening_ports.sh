#!/bin/bash

: '
check internal listening ports
'

execute_command "netstat -ano | findstr LISTENING"
create_new_line
